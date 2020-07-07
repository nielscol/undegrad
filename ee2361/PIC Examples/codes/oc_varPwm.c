
#include <p24Fxxxx.h>
#include <xc.h>
#include <PPS.h>

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

// Goal: Use the output compare module and polling to generate a signal that has the following properties: 
// (1) its rising edges are 4us apart. 
// (2) the signal goes through a cycle 
//     in which the high pulse width 
//     increases from 1us, to 3us with increments of 1us. 
//
// Method: use Output Compare PWM mode in a loop.
//
// Calculations: period = 4us, so PR2 = 63
//               High Pulse Width = 1us, Duty Cycle = 25%, OC1RS = (PR2 + 1) * Duty Cycle = 16.
//               High Pulse Width = 2us, Duty Cycle = 50%, OC1RS = (PR2 + 1) * Duty Cycle = 32.
//               High Pulse Width = 3us, Duty Cycle = 75%, OC1RS = (PR2 + 1) * Duty Cycle = 48.  
// 
// Use Window > Simulator > Analyzer to see the output.

void setup()
{
    PPSUnLock;
    PPSOutput(PPS_RP3,PPS_OC1);
    PPSLock;

    T2CON = 0;
    PR2 = 63;
    TMR2 = 0;
    _T2IF = 0;

    OC1R = 0;
    OC1RS = 0;
    _OCM = 0b110;   // PWM Mode
    _OCTSEL = 0;    // select T2
	
    T2CONbits.TON = 1;
}

int main(void)
{
    int count;
    setup();

    while (1){
        while (_T2IF==0); 
        _T2IF = 0;
        OC1RS += 16;
        if (OC1RS > 48)
            OC1RS = 16;
    }
}
