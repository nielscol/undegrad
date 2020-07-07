#include <p24Fxxxx.h>

#include <xc.h>

#include <PPS.h>

// PIC24FJ64GA002 Configuration Bit Settings

// 'C' source line config statements

// CONFIG2
#pragma config POSCMOD = NONE           // Primary Oscillator Select (Primary oscillator disabled)
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as CLKO (FOSC/2))
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is enabled)
#pragma config FNOSC = FRCPLL           // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))
#pragma config SOSCSEL = SOSC         // Sec Oscillator Select (Low Power Secondary Oscillator (LPSOSC))
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

#define CYCLES 16000000L

void setup()
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;

    TRISAbits.TRISA0 = 1;
    T1CON = 0;
    PR1 = 16000-1;
    T1CONbits.TON = 1;
}

int main(void)
{
    unsigned long int interval = 0, start;
    unsigned long int milliseconds = 0;

    setup();

    while (1)
    {
        while (PORTAbits.RA0)
        {
            if (IFS0bits.T1IF)
            {
                milliseconds++;
                IFS0bits.T1IF = 0;
            }
        }
        start = milliseconds;
        //
        while (!PORTAbits.RA0)
        {
            if (IFS0bits.T1IF)
            {
                milliseconds++;
                IFS0bits.T1IF = 0;
            }
        }
        interval = milliseconds - start;
        // measure the number of instructions that happened
    }
}
