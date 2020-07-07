#include <p24Fxxxx.h>
#include <PPS.h>

#include <xc.h>

#include <stdlib.h>

#if defined(USE_CRYSTAL)
#pragma config POSCMOD = HS             // Primary Oscillator Select (Primary oscillator disabled)
#else
#pragma config POSCMOD = NONE           // don't use primar oscillator at all
#endif
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#if defined(USE_CRYSTAL)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as part of clock)
#else
#pragma config OSCIOFNC = ON           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as port I/O (RC15))
#endif
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is enabled)
#if defined(USE_CRYSTAL)
#pragma config FNOSC = PRIPLL           // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))
#else
#pragma config FNOSC = FRCPLL
#endif
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

volatile unsigned int width = 1599; //initial high width

void __attribute__((__interrupt__,__auto_psv__)) _T2Interrupt(void)
{
    IFS0bits.T2IF = 0;
    OC1RS = width;      //set pulse width
    Nop();      //breakpoint
}

void PPutch(const unsigned int c)
{
    while (!IFS0bits.U1TXIF) ;
    IFS0bits.U1TXIF = 0;
    U1TXREG = c;
}

unsigned int PGetch(void)
{
    unsigned int x;

    while (!IFS0bits.U1RXIF) ;
    x = U1RXREG;
    IFS0bits.U1RXIF = 0;
    return x;
}


void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;  // For digital I/O.  If you want to use analog, you'll
                       // need to change this.

    // add your configuration commands below
    PORTB = 0xffff;
    // TRISB = 0x7fff; // bit 15 is an output
    
    U1MODE = 0;
    U1MODEbits.STSEL = 1; //two stop bits
    U1MODEbits.PDSEL = 1; //even parity
    U1MODEbits.BRGH = 0; //low speed mode
    U1BRG = 103;  // 9600 baud
    U1MODEbits.UEN = 0;
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;
    
    PPSUnLock;
    PPSOutput(PPS_RP3,PPS_OC1);             //set output compare pin
    PPSInput(PPS_U1RX,PPS_RP5);            // set UART pins
    PPSOutput(PPS_RP4,PPS_U1TX);
    PPSLock;

    T2CON = 0;      //Set timer2
    PR2 = 15999; // 1ms
    TMR2 = 0;
    IFS0bits.T2IF = 0;
    IEC0bits.T2IE = 1;

    OC1CON = 0; 
    
    OC1R = 1599;    //initial compare value, proportional to 0.1 ms
    OC1RS = 1599;   //set OC1R to this value if not change by uart thing
    OC1CONbits.OCTSEL = 0; //use TMR2
    OC1CONbits.OCM = 6; //PWM mode

    T2CONbits.TON = 1;

}


int main(int argc, char *argv[])
{
    unsigned int returned;

    
    setup();

    while(1){
        returned = PGetch(); //get character
        if(returned == '+'){
            if(width < 14399) //increment 0.2 ms if not already 0.9ms
                width += 3200;
            else;
                
        }
        if(returned = '-') {
            if(width > 1599) //decrement by 0.2 ms if not already at 0.1ms
                width -=3200;
            else;
        }
        
        
    }


    return 0; // never reached (we hope)
}




