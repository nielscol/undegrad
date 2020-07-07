#include <p24Fxxxx.h>
#include <xc.h>
#include <assert.h>

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

// A very simple buffer is implemented that has only one pointer:
// emptyLocationIdx. New elements are added at this index, and the index
// incremented. The element to be read (and processed) is always ready from
// location 0, after which elements 1..emptyLocationIdx are shifted to
// 0..(emptyLocationIdx-1), and the index emptyLocationIdx decremented.
// This is an inefficient way of implementing buffers, but more intuitive
// compared to the two-pointer buffer.
//
// It makes more sense to use the UART unit in showing how the buffer works,
// but since mplabx doesn't fully simulate UART, I use an artificial setup:
// int0 is raised when the source device has data ready on RB0-RB7.
// The "processing" of data is to keep the sum of 4*x. I intentionally
// chose such a ridiculous computation so that it uses tens of instruction cycles,
// giving us enough time to emulate different scenarios such as the source
// sending bursts of data followed by silent periods.

#define BUFFER_SIZE 4
volatile int emptyLocationIdx=0;
volatile unsigned char buffer[BUFFER_SIZE];


void __attribute__((__interrupt__,__auto_psv__)) _INT0Interrupt(void)
{
    _INT0IF = 0;
    if (emptyLocationIdx < BUFFER_SIZE) { // we are OK, there's still room
                                            // in the buffer.
        buffer[emptyLocationIdx++] = PORTB;
    } else { // buffer overflow. just drop the new data
    }
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0; // make 16MHz

    // setup RB0..7 as input
    AD1PCFG = 0x9fff;
    TRISB = 0xFF;

    _INT0IF = 0;
    _INT0IE = 1;
}


unsigned char readFromBuffer()
{
    unsigned char x;
    int i;

    assert(emptyLocationIdx>0);
    x  = buffer[0];    // to be returned at the end
    // now shift values at indices 1..(emptyLocationIdx-1) to indices
    //   0..(emptyLocationIdx-2)
    for (i=0 ; i<emptyLocationIdx-1 ; i++)
        buffer[i] = buffer[i+1];
    --emptyLocationIdx;
    return x;
}

int main(void)
{
    int sum = 0;

    setup();

    while (1) {
        if (emptyLocationIdx == 0)  // no data in buffer
            continue;
        // now that we are here, there's at least one data in the buffer
        unsigned char x = readFromBuffer();
        sum += x;
    }
}
