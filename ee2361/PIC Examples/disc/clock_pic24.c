// ********************************************************************
// nclocks2.c
//
// Put the chip through the various clocks
//
// ********************************************************************
#include <p24Fxxxx.h>
#include <PPS.h>

#include <xc.h>

#include <stdlib.h>

#ifdef USECRYSTAL
#pragma config POSCMOD = HS             // Primary Oscillator Select (Primary oscillator disabled)
#else
#pragma config POSCMOD = NONE
#endif
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as port I/O (RC15))
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is enabled)
#ifdef USECRYSTAL
#pragma config FNOSC = PRIPLL           // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))
#else
#pragma config FNOSC = FRCPLL
#endif
#pragma config SOSCSEL = SOSC           // Sec Oscillator Select (Default Secondary Oscillator (SOSC))
#pragma config WUTSEL = LEG             // Wake-up timer Select (Legacy Wake-upTimer)
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


volatile unsigned short int button = 0;
volatile unsigned long int milliseconds = 0;
void __attribute__((__interrupt__,__auto_psv__)) _INT2Interrupt(void)
{
    IFS1bits.INT2IF = 0;
    button++;
}
void __attribute__((__interrupt__,__auto_psv__)) _T1Interrupt(void)
{
    IFS0bits.T1IF = 0;
    milliseconds++;
}
// wake up from sleep mode

//void __attribute__((__interrupt__,__auto_psv__)) _CNInterrupt(void)
//{
  //  IFS1bits.CNIF = 0;
//}


void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;  // For digital I/O.  If you want to use analog, you'll
                       // need to change this.
    //TRISB = 3;

    // add your configuration commands below
    T1CONbits.TON = 1;
    T1CONbits.TCKPS = 0;
    PR1 = 15999;
    TMR1 = 0;
    IFS0bits.T1IF = 0;

    TRISBbits.TRISB15 = 0;
    PORTBbits.RB15 = 1;

    TRISBbits.TRISB5 = 1;
    PORTBbits.RB5 = 1;

    CNPU2bits.CN27PUE = 1;

    PPSUnLock;
    // serial port UCA1:  Uses RP4 and RP5
    PPSInput(PPS_INT2,PPS_RP5); // only have one input
    // for Output Compare
    PPSOutput(PPS_RP15, PPS_OC1);
    PPSLock;

    T3CON = 0;
    PR3 = 6249; // Period of PWM will be 363 Pcy = 22.7 us
    T3CONbits.TON = 1;
    T3CONbits.TCKPS1 = 1;
    TMR3 = 0;
    IFS0bits.T3IF = 0;
    IEC0bits.T1IE = 1;

    OC1CONbits.OCTSEL = 1;
    OC1CONbits.OCM = 0b011;

    INTCON2bits.INT2EP = 1;
    IEC1bits.INT2IE = 1;
}

int main(int argc, char *argv[])
{
    unsigned long int j = 0;
    unsigned short int mySwitchCount = 0;
    unsigned long int localMilliseconds = 0;

    setup();

    static const int clock[12] = {
        0b000,      //32MHZ - standard
        0b000,      // 8MHz using FRC Oscillator w/o PLL
        0b001,      //4MHz FRC OSC w/o PLL postscaler of 2
        0b010,      // 2MHz "" "" postscaler of 4
        0b011,      // 1MHz "" "" postscaler of 8
        0b100,      // 500KHz "" "" postscaler of 16
        0b101,      // 250KHz "" "" postscaler of 32
        0b110,      // 125KHz "" "" postscaler of 64
        0b111,      // 31.25KHz "" "" postscaler of 246
        0b111,      // 31KHz using internal low-power RC Osc
        0b000,      // 32MHz standard (reset to normal)
        0b000       // Step when in Sleep Mode
    };

    while (1)
    {
        while (mySwitchCount >= button);  //wait for new button press
        localMilliseconds = milliseconds + 40; // for debounce
        while (milliseconds <= localMilliseconds); //wait for possible switch bounces
        mySwitchCount = button;   // update count
        switch (j)
        {
            case 0:                 //32MHZ - standard
                break;
            case 1:                 // 8MHz using FRC Oscillator w/o PLL
                asm( "push w0");
                asm( "push w1");
                asm( "push w2");
                asm( "push w3");
                asm( "mov.b  OSCCONH,WREG");
                asm("bclr w0, #2");
                asm("bclr w0, #1");
                asm("bclr w0, #0");
                asm( "ior.b  #7,w0");
                asm( "mov  #OSCCONH,w1");
                asm( "mov  #0x78,w2");
                asm( "mov  #0x9A,w3");
                asm( "mov.b  w2,[w1]");
                asm( "mov.b  w3,[w1]");
                asm( "mov.b  WREG,OSCCONH");
                // OSCCONbits.NOSC = 0b111;
                asm( "mov.b  OSCCONL,WREG");
                asm( "ior  #1,w0");
                asm( "mov  #OSCCONL,w1");
                asm( "mov  #0x46,w2");
                asm( "mov  #0x57,w3");
                asm( "mov.b  w2,[w1]");
                asm( "mov.b  w3,[w1]");
                asm( "mov.b  WREG,OSCCONL");
                // OSCCONbits.OSWEN = 1;
                asm( "pop  w3");
                asm( "pop  w2");
                asm( "pop  w1");
                asm( "pop  w0"); 
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 3999;
                break;
            case 2:                 //4MHz FRC OSC w/o PLL postscaler of 2
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 1999;
                break;
            case 3:                 // 2MHz "" "" postscaler of 4
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 999;
                break;
            case 4:                 // 1MHz "" "" postscaler of 8
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 499;
                break;
            case 5:                 // 500KHz "" "" postscaler of 16
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 249;
                break;
            case 6:                 // 250KHz "" "" postscaler of 32
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 124;
                break;
            case 7:                 // 125KHz "" "" postscaler of 64
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 62;
                break;
            case 8:                 // 31.25KHz "" "" postscaler of 246
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 15;
                break;
            case 9:                 // 31KHz using internal low-power RC Osc
               //turn on LPRC (unlock and lock)
                CLKDIVbits.RCDIV = 0; // go back to full speed temporarily
                asm( "push w0");
                asm( "push w1");
                asm( "push w2");
                asm( "push w3");
                asm( "mov.b  OSCCONH,WREG");
                asm("bclr w0, #2");
                asm("bclr w0, #1");
                asm("bclr w0, #0");
                asm( "ior.b  #5,w0");
                asm( "mov  #OSCCONH,w1");
                asm( "mov  #0x78,w2");
                asm( "mov  #0x9A,w3");
                asm( "mov.b  w2,[w1]");
                asm( "mov.b  w3,[w1]");
                asm( "mov.b  WREG,OSCCONH");
                // OSCCONbits.NOSC = 0b101;
                asm( "mov.b  OSCCONL,WREG");
                asm( "ior  #1,w0");
                asm( "mov  #OSCCONL,w1");
                asm( "mov  #0x46,w2");
                asm( "mov  #0x57,w3");
                asm( "mov.b  w2,[w1]");
                asm( "mov.b  w3,[w1]");
                asm( "mov.b  WREG,OSCCONL");
                // OSCCONbits.OSWEN = 1;
                asm( "pop  w3");
                asm( "pop  w2");
                asm( "pop  w1");
                asm( "pop  w0");
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 15;
                break;
            case 10:                // 32MHz standard (reset to normal)
                asm( "push w0");
                asm( "push w1");
                asm( "push w2");
                asm( "push w3");
                asm( "mov.b  OSCCONH,WREG");
                asm("bclr w0, #2");
                asm("bclr w0, #1");
                asm("bclr w0, #0");
                asm( "ior.b  #7,w0");
                asm( "mov  #OSCCONH,w1");
                asm( "mov  #0x78,w2");
                asm( "mov  #0x9A,w3");
                asm( "mov.b  w2,[w1]");
                asm( "mov.b  w3,[w1]");
                asm( "mov.b  WREG,OSCCONH");
                // OSCCONbits.NOSC = 0b111;
                asm( "mov.b  OSCCONL,WREG");
                asm( "ior  #1,w0");
                asm( "mov  #OSCCONL,w1");
                asm( "mov  #0x46,w2");
                asm( "mov  #0x57,w3");
                asm( "mov.b  w2,[w1]");
                asm( "mov.b  w3,[w1]");
                asm( "mov.b  WREG,OSCCONL");
                // OSCCONbits.OSWEN = 1;
                asm( "pop  w3");
                asm( "pop  w2");
                asm( "pop  w1");
                asm( "pop  w0");
                //turn on PLL (unlock and lock
                asm( "push w0");
                asm( "push w1");
                asm( "push w2");
                asm( "push w3");
                asm( "mov.b  OSCCONH,WREG");
                asm( "bclr w0, #1");
                asm( "bclr w0, #2");
                asm( "ior.b  #1,w0");
                asm( "mov  #OSCCONH,w1");
                asm( "mov  #0x78,w2");
                asm( "mov  #0x9A,w3");
                asm( "mov.b  w2,[w1]");
                asm( "mov.b  w3,[w1]");
                asm( "mov.b  WREG,OSCCONH");
                // OSCCONbits.NOSC = 0b001;
                asm( "mov.b  OSCCONL,WREG");
                asm( "ior  #1,w0");
                asm( "mov  #OSCCONL,w1");
                asm( "mov  #0x46,w2");
                asm( "mov  #0x57,w3");
                asm( "mov.b  w2,[w1]");
                asm( "mov.b  w3,[w1]");
                asm( "bset.b  OSCCONL,#0");
                // OSCCONbits.OSWEN = 1;
                asm( "pop  w3");
                asm( "pop  w2");
                asm( "pop  w1");
                asm( "pop  w0");
                CLKDIVbits.RCDIV = clock[j];
                PR1 = 15999;
                break;
            case 11:                // Sleep Mode
                //turn off LED, turn off output compare,
                OC1CON = 0;
                PORTBbits.RB15 = 1;
                asm("pwrsav, #0");
                OC1CONbits.OCTSEL = 1;
                OC1CONbits.OCM = 0b011;
                break;
        }
        j++;
        if (j>=12)
        {
            j=0;
        }

    }

    return 0; // never reached (we hope)
}

