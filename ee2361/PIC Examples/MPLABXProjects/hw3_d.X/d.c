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

/*
 Version 1: Just one channel input on AN0, sampling time = 3*TAD, and manual
 * sampling trigger.
 *
 * To simulate ADC, right click on the project name in the Projects window,
 * select Properties, Simulator, in front of Option Categories, choose ADC,
 * and enable ADC1. SIMULATE timing. Play around with ADCS to see if the
 * simulator responds to different values of TAD.
 *
 * To provide input to ADC1BUF0, do the following: Window > Simulator > Stimulus
 * Click on the Register Injection tab, under Reg/Var select ADC1BUF0, under
 * Trigger choose Demand, and under Data Filename choose a simple text file
 * (that you create outside mplab), which contains a line of text with these
 * values: 23 9F 123 245. Under Register Injection / Wrap select Yes (to wrap-
 * around the input file when it reaches the end), and under Format choose Hex.
 */

volatile int buff[64] = {0};
volatile int index = 0;

//ISR
void __attribute__((__interrupt__)) _ADC1Interrupt(void) {
    _AD1IF = 0;
    buff[index] = ADC1BUF0;
    buff[index+1] = ADC1BUF1;
    buff[index+2] = ADC1BUF2;
    buff[index+2] = ADC1BUF3;
    
    index +=4;
    if(index == 64)
        index = 0;
}

void setup(void) {
    CLKDIVbits.RCDIV = 0;

    AD1PCFG = 0x9ffe; // Set ALL inputs to analog, burn!
    TRISAbits.TRISA0 = 1;
    // Setup on A/D
    AD1CON1 = 0;
    AD1CON2 = 0;
    AD1CON3 = 0;
    AD1CHS = 0;
	AD1CSSL = 0;

    AD1CON1bits.ASAM = 1; // auto-sampling?
    AD1CON1bits.SSRC = 0b111; // auto-conversion

    AD1CON2bits.SMPI = 3; //interrupt after 4 samples converted
    
    AD1CON3bits.SAMC = 24; // corresponds to 3us sample period
    AD1CON3bits.ADCS = 1; // Fastest time for Tad (125ns)
    
    // Configure A/D interrupt
    _AD1IF = 0; // clear flag
    _AD1IE = 1; // enable interrupt

    AD1CON1bits.ADON = 1;
}

int main(void) {
    setup();
    int i, avg;

//    AD1CON1bits.SAMP = 1;   // start sampling

    while (1) {
        for(i = 0; i < 64 ; i++) //sums the samples
            avg += buff[i];
        avg /= 64; // avg ends up being the running average
    }
}

