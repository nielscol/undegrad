
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


void delay(int a){ //delays the number used as argument * 100ms
    while(a > 0){
        TMR1 = 0;
        T1CONbits.TON = 1;
    
        while(IFS0bits.T1IF==0);
        IFS0bits.T1IF = 0;
        T2CONbits.TON = 0; 
        a--;
    }

}

int main(void) {

    CLKDIVbits.RCDIV = 0; //set clock 
    AD1PCFG = 0x9fff; //sets io to be digital
    TRISBbits.TRISB2 = 0;   //set RB2 to output
    TRISBbits.TRISB3 = 0;   //set RB3 as output
    PORTB = 0;
    
    T1CON = 0;  //timer no prescaling, disabled
    T1CONbits.TCKPS = 2;     // set pre-scalar 1:64
    
    PR1 = 24999;            //100 ms equiv
    IFS0bits.T1IF = 0;
    
    while(1){
       LATBbits.LATB2 ^= 1;    //toggle RB2
        delay(1);               //delay RB3 100 ms
        LATBbits.LATB3 ^= 1;    //toggle RB3
        delay(4);               

    }
}

