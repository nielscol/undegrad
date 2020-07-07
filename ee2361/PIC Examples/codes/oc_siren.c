
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

// Goal: to generate a siren with 440Hz and 880Hz segments,
//       each lasting 1s.
// Method: generate continuous output pulses indefinitely using
//          OC1 and T2 to give you 440Hz or 880Hz.
//          Use T1 in int to mark 1sec. In the T1 ISR, change
//          pulse shapes.
// Calculations: period = 1/440 = 1/16M * PR2 * PRE.
//               ==> PRE=1, PR2 = 36,364
//              For the 880Hz, PR2= 18,182
//              We can set OC1R to 20, the OC1RS=20+PR2/2;
//      T1: PRE=256, PR1=62499.

#define PHASE 50            // when to start the high pulse wrt TMR2
//#define PERIOD1 36363
//#define PERIOD2 18181
#define PERIOD1 363
#define PERIOD2 181

void __attribute__((__interrupt__,__auto_psv__)) _T1Interrupt(void)
{
    IFS0bits.T1IF = 0;
    if (PR2==PERIOD2){
        TMR2=0;             // remove this line and see what happens
        PR2 = PERIOD1;
        OC1RS = PHASE+ (PERIOD1>>1);
    } else {
        TMR2=0;
        PR2 = PERIOD2;
        OC1RS = PHASE+ (PERIOD2>>1);
    }
}

void setup()
{
    PPSUnLock;
    PPSOutput(PPS_RP3,PPS_OC1);
    PPSLock;

    T2CON = 0;
//    PR2 = 36363;
    PR2 = 363;
    TMR2 = 0;
    _T2IF = 0;

    OC1R = PHASE;
    OC1RS = PHASE + (PR2>>1);
    _OCM = 0b101;
    _OCTSEL = 0;    // select T2

    T2CONbits.TON = 1;

    T1CON=0;
//    T1CONbits.TCKPS=3;  // PRE=256
//    PR1 = 62499;
    PR1 = 2000;
    TMR1=0;
    _T1IF = 0;
    _T1IE=1;
    T1CONbits.TON=1;
}

int main(void)
{
    int count;
    setup();

    while (1){
    }
}
