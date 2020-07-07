// int_t1T2_isFreqAboveX.c
// Disclaimer: This is NOT the best way to solve the problem.
// For one, T1 is not meant to give an interrupt on every
// rising edge of the T1CK pin. Instead, you are supposed to let
// TMR1 to count the edges and you get that number after T2
// marks the interval (hence you really don't need the T1 ISR
// and the pulsesT1 variable.
// Second: it makes more sense to use INT0 as the input
// because that's what INT0 is meant for. We will look at
// the interaction between INT0 ISR and T1 ISR in disc6.
// Third: you can't count ONE pulse on T1CK. Instead, every
// two pulses will be counted (hence adjust your threshold
// constant to be half of what you want to see).
//
// Having said that, this is meant to show you how T1 and T2
// can work together on a shared variable pulsesT1.
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

// The goal is to turn RB2 1 if the freq on T1CK input is
// above a certain threshold PULSE_COUNT_THRESHOLD between two
// T2 interrupts.
// T1 is setup to give interrupt every time a pulse is seen on T1CK
//   (actually I Couldn't get it to work that way. But counting two
//    pulses did work. So the number in PULSE_COUNT_THRESHOLD should be
//    half the number of expected pulses between T2 interrupts)
// T2 is setup to give interrupts every 1ms

#define PULSE_COUNT_THRESHOLD 10

volatile unsigned long int msecs = 0;   // for debugging purposes
volatile unsigned long int pulsesT1 = 0;   // for counting # pulses on T1
                                            // between T2 interrupts


void __attribute__((__interrupt__,__auto_psv__)) _T1Interrupt(void)
{
    IFS0bits.T1IF = 0;
    ++pulsesT1;
}
void __attribute__((__interrupt__,__auto_psv__)) _T2Interrupt(void)
{
    IFS0bits.T2IF = 0;
    msecs++;    // for debugging purposes
    if (pulsesT1 > PULSE_COUNT_THRESHOLD) {
        PORTBbits.RB2 = 1;
    } else PORTBbits.RB2 = 0;
    pulsesT1 = 0;
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0; // make 16MHz

    // setup RB2 as output
    AD1PCFG = 0x9fff;
    LATBbits.LATB2 = 0;
    TRISB = 0;


    // setup T2 to generate interrupts every 1ms
    T2CON = 0;
    PR2 = 15999;
    TMR2 = 0;
    T2CONbits.TON = 1;

    /* enable Timer 2 interrupt */
    IFS0bits.T2IF = 0;
    IPC1bits.T2IP = 3;
    IEC0bits.T2IE = 1;

    // setup T1 to count the number of pulses on T1CK
    T1CON = 0;
    T1CONbits.TCS=1;
    PR1 = 1;
    TMR1 = 0;
    T1CONbits.TON = 1;

    /* enable Timer 1 interrupt */
    IFS0bits.T1IF = 0;
    IPC0bits.T1IP = 3;
    IEC0bits.T1IE = 1;
}


int main(void)
{
    unsigned long int count = 0;

    setup();

    while (1) {
        count++;
    }
}
