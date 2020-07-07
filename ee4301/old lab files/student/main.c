
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

void setup(){
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;
    TRISA = 31;
    TRISB = 0xF000;
}

void display(char a, char b){
    unsigned int da = convert(a);
    unsigned int db = convert(b);
    
    PORTB = da;
    PORTBbits.RB10 = 1;
    msdelay();
    PORTBbits.RB10 = 0;
    
    PORTB = db;
    PORTBbits.RB11 = 1;
    msdelay();
    PORTBbits.RB11 = 0;
    
    PORTB = 0x3FF;
}

void msdelay(){
    T1CON=0;
    PR1 = 16000; //approx 1ms timer
    IFS0bits.T1IF=0;
    TMR1 = 0;
    T1CONbits.TON = 1;
    
    while(IFS0bits.T1IF==0);
    IFS0bits.T1IF = 0;
    T2CONbits.TON = 0;
}

unsigned int convert(char x){   //converts an single number character to a
    switch(x){                  //the appropriate 16b word to drive the display 
        case '0':
            return 0xF;
        case '1':
            return 0xFF;
        case '2':
            return 0x97;
        case '3':
            return 0x37;
        case '4':
            return 0x267;
        case '5':
            return 0x127;
        case '6':
            return 0x107;
        case '7':
            return 0x7F;
        case '8':
            return 0x7;
        case '9':
            return 0x67;
        default:
            return 0x3FF;
    }
}

int main(void)
{
    setup();
    PORTB = 0x3FF; //sets output so both 7 seg's are off
    
    
}
