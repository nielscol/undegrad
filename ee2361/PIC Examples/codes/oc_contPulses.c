
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

// Goal: to generate a signal with 400us high cycle, 600us low.
// Method: use single output pulse generation in a loop.
// Calculations: period = 1ms, so PR2 = 15,999
//               hi start = 1 = OC1R, low start = 1+0.4*16000 = 6,399 = OC1RS
// We do one pulse, then on T2IF, we check to see if we want
// another pulse (e.g., if the user has kept pressing a key)
// Use Window > Simulator > Analyzer to see the output.
// NOTE: the DEBUG option will use smaller values in PR2 and OC registers for
// debugging purposes

#define DEBUG

void setup()
{
    PPSUnLock;
    PPSOutput(PPS_RP3,PPS_OC1);
    PPSLock;

    T2CON = 0;
#ifdef DEBUG
    PR2 = 159;
#else
    PR2 = 15999;
#endif
    TMR2 = 0;
    _T2IF = 0;

    OC1R = 15;
#ifdef DEBUG
    OC1RS = 5+15;
#else
    OC1RS = 6399+15;
#endif
    _OCM = 0b100;       // change this to 101 from 100. you will not miss any
                        // cycles.
    _OCTSEL = 0;    // select T2

    T2CONbits.TON = 1;
}

int main(void)
{
    int count;
    setup();

    while (1){
        while (_T2IF==0)
            count++;
        _T2IF = 0;
        // put a condition here, e.g., if the user still
        // pressing a key
        _OCM=0b100;
    }
}
