
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
    IFS0bits.T1IF = 0;
    LATBbits.LATB2 ^= 1;
}

void __attribute__((__interrupt__,__auto_psv__)) _T2Interrupt(void)
{
    IFS0bits.T2IF = 0;
    LATBbits.LATB3 ^= 1;
}

int main(void) {

    CLKDIVbits.RCDIV = 0; //set clock 
    AD1PCFG = 0x9fff; //sets io to be digital
    TRISBbits.TRISB2 = 0;   //set RB2 to output
    TRISBbits.TRISB3 = 0;   //set RB3 as output
    PORTB = 0;
    
    T1CON = 0;  //timer no prescaling, disabled
    T1CONbits.TCKPS = 3;     // set pre-scalar 1:254
    
    PR1 = 31249;            //500 ms equiv
    
    T2CON = 0;  //timer no prescaling, disabled
    T2CONbits.TCKPS = 3;     // set pre-scalar 1:254
    PR2 = 6299;            //100 ms equiv
    
    IFS0bits.T1IF = 0;  //clear flag, enable tmr 1 interrupt
    IEC0bits.T1IE = 1;
    TMR1 = 0;   //reset timer
    
    IFS0bits.T2IF = 0;  
    TMR2 = 0;
    
    T1CONbits.TON = 1;  //start timers
    T2CONbits.TON = 1;
    
    while(IFS0bits.T2IF == 0); //delay RB3 100 ms
    T2CONbits.TON = 0;  //stop 100ms tmr2
    IFS0bits.T2IF = 0;
    TMR2 = 0;
    PR2 = 31249;    //configure RB3 500ms toggle period
    IEC0bits.T2IE = 1; //enable tmr 2 interrupt
    T2CONbits.TON = 1; //start 500 ms timer for tmr2
    
    while(1){
        asm("nop"); //some menial task
    }
}

