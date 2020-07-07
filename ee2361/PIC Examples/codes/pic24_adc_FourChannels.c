#include <p24Fxxxx.h>
#include <PPS.h>

#include <xc.h>

#include <stdlib.h>

#if defined(USE_CRYSTAL)
#pragma config POSCMOD = HS             // Primary Oscillator Select (Primary oscillator disabled)
#else
#pragma config POSCMOD = NONE           // don't use primar oscillator at all
#endif
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#if defined(USE_CRYSTAL)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as part of clock)
#else
#pragma config OSCIOFNC = ON           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as port I/O (RC15))
#endif
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Clock switching is enabled, Fail-Safe Clock Monitor is enabled)
#if defined(USE_CRYSTAL)
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

void PPutch(const unsigned int c)
{
    while (!IFS0bits.U1TXIF) ;
    IFS0bits.U1TXIF = 0;
    U1TXREG = c;
}

unsigned int PGetch(void)
{
    unsigned int x;

    while (!IFS0bits.U1RXIF) ;
    x = U1RXREG;
    IFS0bits.U1RXIF = 0;
    return x;
}

unsigned char hexify(unsigned char x)
{
    x &= 15; // just in case
    if (x > 9) x += 7; // the number of characters between 'A' and '9' is 7. 
    x += '0';
    return x;
}

void printHex(unsigned short int x)
{
    unsigned char onesdigit, sixteensdigit, twofiftysixesdigit, four096sdigit;

    PPutch('0');
    PPutch('x');
    onesdigit = hexify(x);
    x >>= 4;
    sixteensdigit = hexify(x);
    x >>= 4;
    twofiftysixesdigit = hexify(x);
    x >>= 4;
    four096sdigit = hexify(x);
    PPutch(four096sdigit);
    PPutch(twofiftysixesdigit);
    PPutch(sixteensdigit);
    PPutch(onesdigit);
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;  // For digital I/O.  If you want to use analog, you'll
                       // need to change this.

    // add your configuration commands below
    PORTB = 0xffff;
    // TRISB = 0x7fff; // bit 15 is an output

    AD1CON1 = 0;
    AD1CHS = 0;
    AD1PCFGbits.PCFG0 = 0;
    AD1PCFGbits.PCFG1 = 0;
    AD1PCFGbits.PCFG2 = 0;
    AD1PCFGbits.PCFG3 = 0;
    AD1CON2 = 0;
    AD1CON3bits.ADCS = 1; // Tad = 2*Tcy = 125ns
    AD1CON3bits.ADRC = 0;
    AD1CON3bits.SAMC = 3; // sample time = 375ns
    AD1CHSbits.CH0SA = 0; // channel selected is channel 0
	AD1CON1bits.SSRC = 0b111; // auto-conversion
    AD1CON1bits.ASAM = 0; // manual-sample
    AD1CON1bits.ADON = 1;

    U1MODE = 0;
    U1MODEbits.BRGH = 1;
    U1BRG = 8;  // 115200 baud
    U1MODEbits.UEN = 0;
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;

    PPSUnLock;
    // serial port UCA1:  Uses RP3 and RP6
    PPSInput(PPS_U1RX,PPS_RP6);            // RP6 is 5-volt tolerant
    PPSOutput(PPS_RP3,PPS_U1TX);
    PPSLock;
}

void printVolts(unsigned short int v)
{
    unsigned char digit[4];

    digit[0] = v%10;
    v = v/10;
    digit[1] = v%10;
    v = v/10;
    digit[2] = v%10;
    v = v/10;
    digit[3] = v%10;

    PPutch(digit[3]+'0');
    PPutch('.');
    PPutch(digit[2]+'0');
    PPutch(digit[1]+'0');
    PPutch(digit[0]+'0');
}

int main(int argc, char *argv[])
{
    unsigned short int result;
    unsigned char c;
	int isValid;
    
    setup();

    int i;
	isValid = 0;
    for (i = 0; i < 30000; i++) i = i;
    PPutch(0x0D);
    PPutch(0x0A);

    while (1)
    {
        if (IFS0bits.U1RXIF)
        {
            c = PGetch();
            PPutch(c);
            switch (c)
            {
            case '0':
                AD1CHSbits.CH0SA = 0; // channel selected is channel 0
				isValid = 1;
                break;
            case '1':
                AD1CHSbits.CH0SA = 1; // channel selected is channel 0
				isValid = 1;
                break;
            case '2':
                AD1CHSbits.CH0SA = 2; // channel selected is channel 0
				isValid = 1;
                break;
            case '3':
                AD1CHSbits.CH0SA = 3; // channel selected is channel 0
				isValid = 1;
                break;
            default:
				isValid = 0;
				break;
            }
			
			if (isValid)
			{
				IFS0bits.AD1IF = 0;
				AD1CON1bits.SAMP = 1; // start sampling, start converting
				while (!IFS0bits.AD1IF);
				IFS0bits.AD1IF = 0;
                result = ADC1BUF0;
                PPutch(0x0D);PPutch(0x0A);
                printHex(result);
                PPutch(0x0D);PPutch(0x0A);
				unsigned long int tmp = 3300;
                tmp = tmp*result;
                tmp = tmp>>10;
                printVolts(tmp);
                PPutch(0x0D);PPutch(0x0A);
			}
        }
    }

    return 0; // never reached (we hope)
}



