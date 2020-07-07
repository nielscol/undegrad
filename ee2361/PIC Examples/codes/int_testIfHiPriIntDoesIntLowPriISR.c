
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

// This program sets the stage to test if higher priority interrupts actually
// do interrupt the interrupt service routine of lower priority interrupts.
// We set up T1 and T2 to the same period, but create a phase difference so that
// T2 always happens a few cycles after T1.
// T1 is set up as lower priority int, T2 as higher.
// The num of cycles: take a look at the disassembly listing to see how many
// instructions in T1's ISR (~16), so we decided ~8-9.
// The way we enforce the 8-9 cycle phase difference is to turn on T2 8-9 cycles
// after T1.

volatile unsigned long int msecs = 0;


void __attribute__((__interrupt__,__auto_psv__)) _T1Interrupt(void)
{
    IFS0bits.T1IF = 0;
    msecs++;                // THIS LINE gets interrupted by T2
}

void __attribute__((__interrupt__,__auto_psv__)) _T2Interrupt(void)
{
    IFS0bits.T2IF = 0;
    msecs--;
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0; // make 16MHz

    T1CON = 0;
    PR1 = 50;
    TMR1 = 0;
    // don't turn on T1 yet...

    IFS0bits.T1IF = 0;
    IPC0bits.T1IP = 2;    // if you switch around the priority levels, then the
                        // interrupt within interrupt would NOT happen.

    T1CONbits.TON = 1;   // THIS LINE is intentionally placed ~9 instructions before turning on T2
    // to create a phase difference of 9 cycles.


    /* enable Timer 1 interrupt */
    IEC0bits.T1IE = 1;

    T2CON = 0;
    PR2 = 50;
    TMR2 = 0;

    // Time 2
    IFS0bits.T2IF = 0;
    IPC1bits.T2IP = 3;

    /* enable Timer 2 interrupt */
    IEC0bits.T2IE = 1;

    T2CONbits.TON = 1;

}


int main(void)
{
    unsigned long int count = 0;

    setup();

    while (1) {
        count++;
    }
}
