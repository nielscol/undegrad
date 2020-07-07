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

void setup(void)
{
    CLKDIVbits.RCDIV = 0;

    AD1PCFG = 0x9fff;
    LATB = 0xffff;
    TRISB = 3;
    CNPU1bits.CN2PUE = 1;  // note: RA0 is CNPU2, not CNPU1!
}

void msec(void)
{
    unsigned int ms = 1627; // I didn't even divide, just "guestimated"

    while (ms--) ;
}

void msecs(unsigned int ms)
{
    while (ms--) msec();
}

int main(void)
{
    unsigned long int count = 0;

    setup();

    while (1)
    {
        // wait for the switch to close
        //while (PORTAbits.RA0) ;
        // debounce
        msecs(40);
        // increment the count
        count++;
        // write value to PORT B
        PORTB = (count << 2);
        // wait for the switch to open
        while (!PORTAbits.RA0) ;
        // debcounce
        msecs(40);
    }
}
