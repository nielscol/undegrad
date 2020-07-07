#include <p24Fxxxx.h>
#include <PPS.h>

#include <xc.h>
#include <math.h>

#include <stdlib.h>
#pragma config POSCMOD = HS             // Primary Oscillator Select (Primary oscillator disabled)
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as port I/O (RC15))
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is enabled)
#pragma config FNOSC = PRIPLL           // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))
#pragma config SOSCSEL = SOSC           // Sec Oscillator Select (Default Secondary Oscillator (SOSC))
#pragma config WUTSEL = LEG             // Wake-up timer Select (Legacy Wake-upTimer)
#pragma config IESO = ON                // Internal External Switch Over Mode (IESO mode (Two-Speed Start-up) enabled)

// CONFIG1
#pragma config WDTPS = PS32768          // Watchdog Timer Postscaler (1:32,768)
#pragma config FWPSA = PR128            // WDT Prescaler (Prescaler ratio of 1:128)
#pragma config WINDIS = ON              // Watchdog Timer Window (Standard Watchdog Timer enabled,(Windowed-mode is disabled))
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (Watchdog Timer is disabled)
#pragma config ICS = PGx1               // Comm Channel Select (Emulator EMUC1/EMUD1 pins are shared with PGC1/PGD1)
#pragma config GWRP = OFF               // General Code Segment Write Protect (Writes to program memory are allowed)
#pragma config GCP = OFF                // General Code Segment Code Protect (Code protection is disabled)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG port is disabled)

volatile unsigned char buffer[64];
volatile unsigned char front = 0;
volatile unsigned char back = 0;

void __attribute__((__interrupt__,__auto_psv__)) _U1RXInterrupt(void)
{
    IFS0bits.U1RXIF = 0;
    buffer[front++] = U1RXREG;
    front &= 63;
}
void PPutch(const unsigned char c)
{
    while (!IFS0bits.U1TXIF) ;
    IFS0bits.U1TXIF = 0;
    U1TXREG = c;
}
unsigned char PGetch(void)
{
    unsigned char x;

    while (front == back) ;
    x = buffer[back++];
    back &= 63;
    return x;
}
void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9ffe;  // For digital I/O.  If you want to use analog, you'll
                       // need to change this.

    // Setup on A/D
    AD1CON1 = 0;
    AD1CON2 = 0;
    AD1CON3 = 0;
    AD1CHS = 0;
	AD1CSSL = 0;

    //AD1CON1bits.ASAM = 1; // auto-sampling?
    AD1CON1bits.SSRC = 0b111; // auto-conversion

    AD1CON3bits.SAMC = 3; // auto-sample time = X * TAD (what is X?)
    AD1CON3bits.ADCS = 1; // clock = Y * Tcy (what is Y?)
    
    // what is the combined T_SAMP and T_CONV as a result of the two lines above?

    // Configure A/D interrupt
    _AD1IF = 0; // clear flag
//    _AD1IE = 1; // enable interrupt

    AD1CON1bits.ADON = 1;
    
    // add your configuration commands below
    PORTB = 0xffff;
    TRISB = 0x7fff; // bit 15 is an output
    TRISAbits.TRISA0 = 1;
    U1MODE = 0;
    U1BRG = 8; 
    U1MODEbits.UEN = 0;
    U1MODEbits.UARTEN = 1; // Enable/Disable UART

    U1STAbits.UTXEN = 1; //Transmit Enable/Disable bit

    PPSUnLock;
    // serial port UCA1:  Uses RP6 and RP3
    PPSInput(PPS_U1RX,PPS_RP6);
    PPSOutput(PPS_RP3,PPS_U1TX);
    PPSLock;
    IFS0bits.U1RXIF = 0;
    // Use Polling instead of ISRs
    IEC0bits.U1RXIE = 1;
}

int main(int argc, char *argv[])
{

    setup();
    
    int samples[512], average, svar, stddev;
    int i,j,k = 0;
    PPutch(0x0D);
    PPutch(0x0A);
    
    i = 0;
//    while (1)
//    {
//        unsigned char x;
//
//        x = PGetch();
//        PPutch(x);
//    }
    
    while(1) {
        AD1CON1bits.SAMP = 1;   // start sampling
        while(!AD1CON1bits.DONE);   // wait until conversion is done
        if (i == 0){
            samples[i] = ADC1BUF0;
            average = ((average * i)+ samples[i])/(i+1);
            svar = 0;
            for(j = 0; j <= i ; j++){
                svar += (average - samples[j])*(average - samples[j]);
            }
            svar = (1/(i+1))*svar;
            stddev = sqrt(svar);
        }
        

        
        buffer[front++] = U1RXREG;
        front &= 63;
        PPutch('a');
        if(i =512)
            k = 1;
    }
    return 0; // never reached (we hope)
}
