#include <p24Fxxxx.h>

#include <xc.h>

#include <PPS.h>

// PIC24FJ64GA002 Configuration Bit Settings

// 'C' source line config statements

// CONFIG2
#pragma config POSCMOD = NONE           // Primary Oscillator Select (Primary oscillator disabled)
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as CLKO (FOSC/2))
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is enabled)
#pragma config FNOSC = FRCPLL           // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))
#pragma config SOSCSEL = SOSC         // Sec Oscillator Select (Low Power Secondary Oscillator (LPSOSC))
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

#define CYCLES 16000000L

// Use RB9 - RB2 for the segments
//    ------ABCDEFGP-- (active low)
const unsigned int patterns[] = {
    0b0000000000001100,   // '0'
    0b0000001001111100,   // '1'
    0b0000000010010100,   // '2'
    0b0000000000110100,   // '3'
    0b0000001001100100,   // '4'
    0b0000000100100100,   // '5'
    0b0000000100000100,   // '6'
    0b0000000001111100,   // '7'
    0b0000000000000100,   // '8'
    0b0000000001000100,   // '9'
    0b0000000000100100,   // 'A'
    0b0000001100000100,   // 'b'
    0b0000000110001100,   // 'C'
    0b0000001011101100,   // 'd'
    0b0000000110000100,   // 'E'
    0b0000000111000100,   // 'F'
    0b0000001111111100    // all off
};

#define SEGMASK1 0b1100000000000011

// initialize the patterns to "0000"

unsigned short int digits[4] = {0x000C, 0x000C, 0x000C, 0x000C};

// The pins we use use for the digit enables are RB13-RB10
#define SEGMASK2 0b0000010000000011;
#define SEGMASK3 0b0000100000000011;
#define SEGMASK4 0b0001000000000011;
#define SEGMASK5 0b0010000000000011;

// updateDisplay takes an input and makes the digits have the appropriate
// patterns to display the indicated number as a decimal value
void updateDisplay(unsigned short int val)
{
    digits[0] = patterns[val % 10];
    val /= 10;
    digits[1] = patterns[val % 10];
    val /= 10;
    digits[2] = patterns[val % 10];
    val /= 10;
    digits[3] = patterns[val % 10];
}

// multiplexDisplay cycles which digit is being displayed (only one is on
// at any time. Because we are using the bits in PORTB for multiple uses,
// we use an and/or masking scheme to avoide changing bits we don't want
// to inadvertently change while changing the pins we need to change.
void multiplexDisplay(void)
{
    static unsigned int digit = 0;

    switch (digit)
    {
    case 0:
        LATB &= SEGMASK1;
        LATB |= digits[0] | SEGMASK2;
        break;
    case 1:
        LATB &= SEGMASK1;
        LATB |= digits[1] | SEGMASK3;
        break;
    case 2:
        LATB &= SEGMASK1;
        LATB |= digits[2] | SEGMASK4;
       break;
    case 3:
        LATB &= SEGMASK1;
        LATB |= digits[3] | SEGMASK5;
        break;
    }
    digit++;
    digit &= 3;
}


void setup(void)
{
    CLKDIVbits.RCDIV = 0; // make 16MHz
    AD1PCFG = 0x9fff; // all digital inputs and outputs

    LATB |= 0b1000001111111100;
    LATB &= 0b1100001111111111;
    TRISB &= 0b0100000000000011;

    T2CON = 0;
    PR2 = 15999;
    T2CONbits.TON = 1;

    // turn off all the digits to start
    LATBbits.LATB10 = 0;
    LATBbits.LATB11 = 0;
    LATBbits.LATB12 = 0;
    LATBbits.LATB13 = 0;
    LATB = LATB | 0b1100001111111111;
}

int main(void)
{
    unsigned long int seconds = 0;
    unsigned long int milliseconds = 0;

    setup();

    while (1)
    {
        // maintain a 1-second clock
        // by counting milliseconds.
        unsigned short int ms = 1000;

        while (!IFS0bits.T2IF) ;
        IFS0bits.T2IF = 0;
        multiplexDisplay();
        if (!--ms)
        {
            ms = 1000;
            seconds++;
            updateDisplay(seconds);
        }
    }
}

