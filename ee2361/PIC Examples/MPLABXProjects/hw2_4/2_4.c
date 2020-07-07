
#include <p24Fxxxx.h>
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

volatile unsigned int pulses = 0;

void __attribute__((__interrupt__,__auto_psv__)) _INT0Interrupt(void)
{
    _INT0IF = 0;
    pulses++;
}

void __attribute__((__interrupt__,__auto_psv__)) _INT1Interrupt(void)
{
    _INT1IF = 0;
    pulses++;
}

int main(void) {
    CLKDIVbits.RCDIV = 0; //set clock 
    AD1PCFG = 0x9fff; //sets io to be digital
    TRISBbits.TRISB2 = 0;   //set RB2 to output
    TRISBbits.TRISB7 = 1;   //set RB7 as input (INT0 pin)
    TRISBbits.TRISB8 = 1;   //set RB8 as input (INT1 pin)
    PORTB = 0;
    
    _INT0IF = 0;
    IPC0bits.IC1IP = 4;     //INT0 priority = 4
    INTCON2bits.INT0EP = 0; //interrupt on pos edge
    
    _INT1IF = 0;
    RPINR0bits.INT1R = 8;   //assign int1 to rp7
    IPC5bits.INT1IP = 3;    //priority = 3
    INTCON2bits.INT1EP = 0; //interrupt on pos edge

    IEC0bits.INT0IE = 1;    //turn on interrupts
    IEC1bits.INT1IE = 1;
    
    while(1){
        if(pulses >= 10)
            LATBbits.LATB2 = 1;
    }
}

