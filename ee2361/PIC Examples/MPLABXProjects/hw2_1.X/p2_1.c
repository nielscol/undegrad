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

void __attribute__((__interrupt__,__auto_psv__)) _T1Interrupt(void)
{
    LATBbits.LATB2 ^= 1;
    IFS0bits.T1IF = 0;
    
}

int main(void) {
    CLKDIVbits.RCDIV = 0; //set clock
    AD1PCFG = 0x9fff; //sets io to be digital
    TRISBbits.TRISB2 = 0;   //set RB2 to output
    
    T1CON = 0;  //timer no prescaling, disabled
    T1CONbits.TCKPS = 0;   // set pre-scalar 1:1
    PR1 = 1777; //
    TMR1 = 0;   //reset timer
    
    IFS0bits.T1IF = 0; //clear interrupt flag
    IPC0bits.T1IP = 3; //set interrupt priority
    IEC0bits.T1IE = 1; //enable interrupts
    
    T1CONbits.TON = 1;
    
    while(1){
        asm("nop"); //give the loop something (not really) to do
    }
}

