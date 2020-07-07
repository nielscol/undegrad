#include <p24Fxxxx.h>
#include <xc.h>

// PIC24FJ64GA002 Configuration Bit Settings
// 'C' source line config statements
#include <xc.h>

// CONFIG2
#pragma config POSCMOD = NONE           // Primary Oscillator Select (Primary oscillator disabled)
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as CLKO (FOSC/2))
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is enabled)
#pragma config FNOSC = FRCPLL           // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))
#pragma config SOSCSEL = SOSC           // Sec Oscillator Select (Default Secondary Oscillator (SOSC))
#pragma config WUTSEL = LEG             // Wake-up timer Select (Legacy Wake-up Timer)
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

// The purpose of this code is to compare the accuracy and instruction
// cycle overhead of polling vs interrupt on T1
// We play around with how much of the time keeping to relegate
// to the hardware (e.g., if we ask the hardware to give us
// 100ms using a pre of 256, the software effort would be minimal. But
// if we make the hardware mark 1ms, then the software has to poll
// or interrupt 100 times to get 1ms.

volatile int msecs = 0;

void __attribute__((__interrupt__,__auto_psv__)) _T1Interrupt(void)
{
    IFS0bits.T1IF = 0;
    ++msecs;
    if (msecs==100) {
        msecs = 0;
        // flip RB2 or whatever you wanted to do after 100ms
        _RB2 ^= 1;
    }
}

void __attribute__((__interrupt__,__auto_psv__)) _T2Interrupt(void)
{
    IFS0bits.T2IF = 0;
    // flip RB2 or whatever you wanted to do after .1 sec
    _RB2 ^= 1;
    asm("btg PORTB, #2");
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0; // make 16MHz

    // setup RB2 as output
    AD1PCFG = 0x9fff;
    LATBbits.LATB2 = 0;
    TRISB = 0;

    // setup T2 to generate T2IF every 1s
    T2CON = 0;
    PR2 = 6249;    // .1s = 1/16M * PRE * (PR2+1). Choose PRE=256
                    //     solve for PR2.
    TMR2 = 0;
    T2CONbits.TCKPS = 0; // pre=256
    IFS0bits.T2IF = 0;
    T2CONbits.TON = 1;


    // setup T1 to mark 1ms
    T1CON = 0;
    PR1 = 15999;
    TMR1 = 0;
    IFS0bits.T1IF = 0;
    T1CONbits.TON = 1;
}


int main(void)
{
    int count = 0;

    setup();

    // first do polling on T2 (setup to mark 1s)
    T2CONbits.TON = 0;
    TMR2 = 0;
    _T2IF = 0;
    T2CONbits.TON = 1;
    while (_T2IF==0);
    _T2IF=0;
    _RB2 ^= 1;

    // now do polling on T1 (setup to mark 1ms)
    T1CONbits.TON = 0;
    IFS0bits.T1IF = 0;
    TMR1 = 0;
    T1CONbits.TON = 1;
    for (count=0 ; count<100 ; count++) {
        //TMR1=0;      // this line is unnecessary and in fact hurts the accuracy
        while (_T1IF==0);
        _T1IF=0;
    }
    _RB2 ^= 1;

    /* enable Timer 2 interrupt */
    _T2IF = 0;
    TMR2 = 0;
    _T2IE = 1;

    /* enable Timer 1 interrupt */
    TMR1 = 0;
    _T1IF = 0;
//    _T1IE = 1;


    while (1) {
    }
}
