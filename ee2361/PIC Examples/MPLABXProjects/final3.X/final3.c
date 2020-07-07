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

volatile unsigned int ch2, ch8;

void __attribute__((__interrupt__,__auto_psv__)) _T1Interrupt(void)
{
    int temp2, temp8;
    
    IFS0bits.T2IF = 0;
    AD1CHSbits.CH0SA =2;
    
    IFS0bits.AD1IF = 0;
    AD1CON1bits.SAMP = 1; // start sampling, start converting
    while (!IFS0bits.AD1IF);
    IFS0bits.AD1IF = 0;
    ch2 = ADC1BUF0;
    
    AD1CHSbits.CH0SA = 8;
    
    IFS0bits.AD1IF = 0;
    AD1CON1bits.SAMP = 1; // start sampling, start converting
    while (!IFS0bits.AD1IF);
    IFS0bits.AD1IF = 0;
    ch8 = ADC1BUF0;
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;  // For digital I/O.  If you want to use analog, you'll
                       // need to change this.

    // add your configuration commands below
    PORTB = 0xffff;
    // TRISB = 0x7fff; // bit 15 is an output

    AD1CON1 = 0;
    AD1CHS = 0;
    AD1PCFGbits.PCFG2 = 0; //set AN0 and AN8 to be analog NOTE not avail on 28 pin pic
    AD1PCFGbits.PCFG8 = 0;
    AD1CON2 = 0;
    AD1CON3bits.ADCS = 1; // Tad = 2*Tcy = 125ns (minimum that is > 75ns)
    AD1CON3bits.ADRC = 0;
    AD1CON3bits.SAMC = 5; // sample time = 5*125 ns = 625ns
    AD1CHSbits.CH0SA = 0; // channel selected is channel 0
	AD1CON1bits.SSRC = 0b111; // auto-conversion
    AD1CON1bits.ASAM = 0; // manual-sample
    AD1CON1bits.ADON = 1;
    AD1CON2bits.SMPI = 7; //interrupt after 8 samples
    
    T1CON = 0;      //Set timer2
    T1CONbits.TCKPS = //3; 1:256 prescale
    PR1 = 12499; // 200ms period
    TMR1 = 0;
    IFS0bits.T1IF = 0;
    IEC0bits.T1IE = 1;
    
    T1CONbits.TON = 1;
}


int main(int argc, char *argv[])
{
    
    setup();


    while (1)
    {
        
    }

    return 0; // never reached (we hope)
}



