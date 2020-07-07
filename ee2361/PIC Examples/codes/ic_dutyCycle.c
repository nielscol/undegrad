#include <p24Fxxxx.h>
#include <xc.h>
#include <PPS.h>

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
 This program monitors an external signal connected to the IC1/RP3 pin, and
 * sets RB0 if the duty cycle is more than 50% in each period. Uses polling on
 * IC1IF. Uses T2 overflow count in T2Int to ensure timer overflows do not
 * result in the wrong subtraction of consecutive ICBUF values.
 *
 * To test the program: Use Window > Simulator > Stimulus. Click on the
 * Pin/Register Actions, choose cyc as Time Units. Add the IC1 signal. Add the
 * following rows:
 * Time   IC1
 * 1000   1
 * 1200   0
 * 1500   1
 * 2000   0
 * 2100   1
 *
 * The first cycle has a (1500-1200)/(1200-1000) duty cycle ==> RB0 = 0
 * The second cycle has a (2100-2000)/(2000-1500) duty cycle ==> RB0 = 1
 */


volatile unsigned long int tOverflowCount = 0;   // count timer overflows

void __attribute__((__interrupt__,__auto_psv__)) _T2Interrupt(void)
{
IFS0bits.T2IF = 0;
    ++tOverflowCount;
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0; // make 16MHz

    // setup IC pin as input, RB0 output
    AD1PCFG = 0x9fff;
    TRISBbits.TRISB3 = 1;   // RP3 == RB3. Config as input pin.
    TRISBbits.TRISB0 = 0;   // RB0 output
    PORTB=0;

    // setup T2 to get a long time before roll over
    T2CON = 0;
    PR2 = 64999;
    TMR2 = 0;
    IFS0bits.T2IF = 0;
    T2CONbits.TON = 1;

    // Setup the IC pin
    PPSUnLock;
    PPSInput(PPS_IC1,PPS_RP3);
    PPSLock;

    // Setup the IC unit to wait for a rising edge, use T2 as timer base.
    IC1CON=0;
    IC1CONbits.ICTMR = 1;   // use T2 as timer base.
    _IC1IF = 0;
    IC1CONbits.ICM = 3;     // every rising edge
}

// MAKE SURE you set ICM to the right edge polarity before calling this.
// returns IC1BUF + overflow time for T2.
// temporarily disables interrupts to ensure the 32-bit value
// of tOverFlowCount is fetched correctly (e.g., if the val is 0x12FFFF,
// the interrupt might change it to 0x130000 in the middle of fetching the
// 32-bit value, ending up in getting either 0x120000 or 0x13FFFF).
unsigned long int getEdgeTime()
{
    char prevIntLevel;
    unsigned long int ovCount;
    
    while (_IC1IF==0);
    _IC1IF = 0;
    prevIntLevel = _IPL;
    _IPL = 7;   // disable interrupts temporarily
    ovCount = tOverflowCount;
    _IPL = prevIntLevel;    // re-enable interrupts
    return IC1BUF + 65000L*ovCount;
}

int main(void)
{
    unsigned long int alpha = 0, beta;
    unsigned long int positive, negative;   // see the comment below.

    setup();

    /*
     * Waveform:
     *             +-----------+       +-------+           +
     *             |           |       |       |           |
     * ------------+           +-------+       +-----------+
     *             alpha       beta    gamma
     *
     * alpha: beginning of cycle
     * beta: falling edge
     * gamma: end of cycle = beginning of next cycle
     *
     * positive = beta - alpha
     * negativ = gamma - beta
     */

    // get the first alpha
    IC1CONbits.ICM = 3;     // every rising edge
    alpha = getEdgeTime();

    while (1) {
        // now setup for detecting falling edge beta
        IC1CONbits.ICM = 2;     // every falling edge
        beta = getEdgeTime();
        positive = beta - alpha;

        // now wait for gamma (or the next cycle's alpha)
        IC1CONbits.ICM = 3;     // every rising edge
        alpha = getEdgeTime();
        negative = alpha - beta;

        if (positive > negative)
            PORTBbits.RB0 = 1;
        else PORTBbits.RB0 = 0;

        // we are all set for the next cycle: alpha is already set.
    }
}
