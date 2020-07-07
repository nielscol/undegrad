#include <p24Fxxxx.h>
#include <PPS.h>

#include <xc.h>

#include <stdlib.h>

#ifdef USECRYSTAL
#pragma config POSCMOD = HS             // Primary Oscillator Select (Primary oscillator disabled)
#else
#pragma config POSCMOD = NONE
#endif
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as port I/O (RC15))
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is enabled)
#ifdef USECRYSTAL
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

volatile unsigned char buffer[32];
volatile unsigned char front = 0;
volatile unsigned char back = 0;

// This code is for interfacing with the MCP4821 DAC unit, which has an SPI interface.
// We need to send 16-bit SPI output, where the four most significant bits are the commands
// determining the gain and whether to shut down the DAC unit, followed by 12 bits of data.
// The SPI clock speed of 16MHz is not too fast (the DAC manual says 20MHz is the max), and if we
// want slower transmission, we can choose a PRE of 1:2 in the SPI clock.
// We setup T2 to give us 22.7us for each analog voltage. The 22.7us is safely longer than the
// 8 * SPI_CLOCK_PERIOD, which is 0.5us with a primary and secondary SPI clock pre set to 1.

#define DACMASK 0x1FFF
#define DACBITS 0x1000

volatile unsigned short int sample = DACBITS;


void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;  // For digital I/O.  If you want to use analog, you'll
                       // need to change this.
    TRISB = 0xffff;    // make all PORTBbits inputs initially

    // add your configuration commands below
    PORTB = 0xffff;
    PORTBbits.RB7 = 0; //CE will be low (off)
    
    TRISBbits.TRISB7 = 0; //RB7 will be CE, enables it as output

    T2CON = 0;
    PR2 = 9374; //approx 150ms period
    T2CONbits.TCKPS = 3; //prescale 1:256
    IFS0bits.T2IF = 0;
    


    PPSUnLock;
    // SPI uses RP5 and RP4 (ignores SDI1)
    PPSOutput(PPS_RP4, PPS_SCK1OUT);
    PPSOutput(PPS_RP5, PPS_SDO1);   // RP5 outputs to SDI of slave
    PPSInput(PPS_SDI1, PPS_RP6);    //Slave output goes to RP6
    PPSLock;


    SPI1CON1 = 0;
    SPI1CON1bits.MSTEN = 1;  // master mode
    SPI1CON1bits.MODE16 = 0; // Single byte
    SPI1CON1bits.CKE = 0; //the next two lines make active edge the rising one
    SPI1CON1bits.CKP = 0;
    SPI1CON1bits.SPRE = 0b110; // secondary prescaler = 2   //these lines correspond to 8MHz 
    SPI1CON1bits.PPRE = 0b11;  // primary prescaler = 1; 
    // SPI1CON1bits.PPRE = 0b01;  // primary prescaler = 16;
    SPI1CON2 = 0;
    SPI1CON2bits.SPIBEN = 1; //enhanced buffer enabled
    SPI1STAT = 0;
    SPI1STATbits.SISEL = 0b001; //interrupt when data available in receive buf
    SPI1STATbits.SPIEN = 1;
    
    IFS0bits.SPI1IF = 0;

    IFS0bits.T2IF = 0;
    TMR2 = 0;

    
    IPC1bits.T2IP = 5;
    IEC0bits.T2IE = 1;
    T2CONbits.TON = 1;
    
    TRISBbits.TRISB7 = 1;   //enable TC72 (pull CE high)  
    
        //TC72 configuration, enhanced mode so back to back can be done with no wait
    SPI1BUF = 0x80; //address byte to FIFO
    SPI1BUF = 0b00010001; //Sets TC72 to continuous mode to FIFO
    
}

int main(int argc, char *argv[])
{
    int i, msb, lsb, cont,temp,isnegative;
    setup();
    
    
    
    
    /*
    // if you want to send data back-to-back, use either polling
    // like below, or use an ISR for the SPI
    for (i=0 ; i<10 ; i++) {
        SPI1BUF = i;
        while (_SPI1IF==0);
        _SPI1IF = 0;
    }

     */
    while (1){
        while(IFS0bits.T2IF == 0); //wait 150ms
        IFS0bits.T2IF =0; 
        
        SPI1BUF = 0x02; //addresses read opeation
        while(IFS0bits.SPF1IF == 0); //wait for data to be available in receive 
        IFS0bits.SPF1IF = 0;
        msb = SPI1BUF; //msb of temp
        lsb = SPI1BUF; //lsb of temp
        cont = SPI1BUF; //control byte
        
        if(cont != 0b00010001) //if control not right
            SPI1BUF = 0b00010001; //rewrite
        
        temp = msb;
        temp <<= 8; //shift over 8 bits
        temp += lsb;
        temp >>= 8; //shift back 8 bits
        
        
        
    }

    return 0; // never reached (we hope)
}

