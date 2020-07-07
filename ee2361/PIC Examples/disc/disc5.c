// ****************************************************************************
// disc5.c -- interface to a hexadecimal keypad
//
//  Keypad interface is: RB15 - RB12 --> rows 3 - 0
//                       RA3  - RA0  --> columns 3 - 0
//  We assume the keypad encoding is as in the "Keypads_88.pdf" for the hex
//  keypad, and that, when row 0 and column 0 are shorted, button "0" is
//  pressed, when row 0 and column 1 are shorted, button "1" is pressed, and
//  so on.  If this is not the case, we suggest using a "lookup table" as
//  shown below.
// ****************************************************************************
#include <p24Fxxxx.h>

#include <xc.h>

#pragma config POSCMOD = NONE           // Primary Oscillator Select (Primary oscillator disabled)
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = ON            // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as port I/O (RC15))
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

#define NOKEY 255

unsigned char scan(unsigned short int row)
{
    static unsigned char LUT[] = {NOKEY,NOKEY,NOKEY,NOKEY,NOKEY,NOKEY,NOKEY,3,
        NOKEY,NOKEY,NOKEY,2,NOKEY,1,0,NOKEY};
    unsigned char key;

    key = PORTA & 15;
    key = LUT[key];
    if (key == NOKEY) return key;
    key += 4*row;
    return  key;
}

// KBMASK1 is used to mask off the bits in PORTB we don't use (RB12-RB0)
#define KBMASK1 0x0fff
unsigned int rowPatterns[4] = {0xe000, 0xd000, 0xb000, 0x7000};

unsigned char lookupTable[16] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
    13, 14, 15}; // assuming the normal encoding.  To change it, just switch
                 // around the elements to make things turn out like you want.

unsigned char cbuffer[16];
unsigned int front = 0;
unsigned int back = 0;

void put(unsigned char x)
{
    cbuffer[front++] = x;
    front &= 15;
}

unsigned char get(void)
{
    unsigned char x;

    if (front == back) return NOKEY;

    x = cbuffer[back++];
    back &= 15;
    return x;
}

void waitOneMillisecond(void)
{
    static unsigned short int row = 0;
    static unsigned char lastKey[] = {NOKEY,NOKEY,NOKEY,NOKEY};
    static unsigned short int debounce  = 0;
    unsigned char key;

    while (!IFS0bits.T1IF) ;
    IFS0bits.T1IF = 0;
    if (debounce)
    {
        debounce--;
        return;
    }
    key = scan(row);
    if (key != lastKey[row])
    {
        lastKey[row] = key;
        if (key != NOKEY)
        {
            // for nonstandard encoding: put( lookupTable[key]);
            put(key);
        }
        debounce = 40;
    }
    row++;
    row &= 3;
    LATB = LATB & KBMASK1;
    LATB |= rowPatterns[row];
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;  // For digital I/O.  If you want to use analog, you'll
                       // need to change this.

    // add your configuration commands below
    TRISAbits.TRISA0 = 1;
    TRISAbits.TRISA1 = 1;
    TRISAbits.TRISA2 = 1;
    TRISAbits.TRISA3 = 1;
    CNPU1bits.CN2PUE = 1;
    CNPU1bits.CN3PUE = 1;
    CNPU2bits.CN30PUE = 1;
    CNPU2bits.CN29PUE = 1;

    PORTBbits.RB12 = 1;
    PORTBbits.RB13 = 1;
    PORTBbits.RB14 = 1;
    PORTBbits.RB15 = 1;
    TRISBbits.TRISB12 = 0;
    TRISBbits.TRISB13 = 0;
    TRISBbits.TRISB14 = 0;
    TRISBbits.TRISB15 = 0;

    T1CONbits.TON = 1;
    T1CONbits.TCKPS = 0;
    PR1 = 15999;
    TMR1 = 0;
    IFS0bits.T1IF = 0;
}

int main(int argc, char *argv[])
{
    static unsigned char k;

    setup();

    while (1)
    {
        if ((k = get()) != NOKEY)
        {
            // do something with the character, maybe
            k = k;
        }
    }

    return 0; // never reached (we hope)
}

