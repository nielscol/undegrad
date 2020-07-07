//****************************************************************************//
//EE 2361                                                                     //
//Lab 7                                                                   //
//                                                                            //
//1. The resolution of the voltage display is .001 volt.                      //
//2. The accuracy of the voltage display is within .001 volt.                 //
//3. The program takes:                                                       //
// 1.31us handling ADC                                                        //
// .195us handling UART                                                       //
// 30.2125us computing the result                                             //
// 12.50775ms coverting the result to ASCII                                   //
//****************************************************************************//


#include <p24Fxxxx.h>

#include <PPS.h>

#include <xc.h>

#include <math.h>

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

volatile unsigned int current = 0;  //stores index of sample array
unsigned char buffer[64];
unsigned char front = 0;
unsigned char back = 0;
unsigned short int aBuff[512]; //used to store the 512 samples of the ADC
unsigned short int bufferState;


void __attribute__((__interrupt__,__auto_psv__)) _U1RXInterrupt(void)
{

    IFS0bits.U1RXIF = 0;
    buffer[front++] = U1RXREG;
    front &= 63;
}

void __attribute__((__interrupt__,__auto_psv__)) _ADC1Interrupt(void)
{
        IFS0bits.AD1IF = 0;
        if(current == 512)  //resets index if too high
            current = 0;
        aBuff[current] = ADC1BUF0; //stores ADC val to current sample index
        current++;
}

void PPutch(const unsigned char c)
{
    unsigned short int tmp = 5000;
    while (tmp--) tmp = tmp;

    IFS0bits.U1TXIF = 0;
    U1TXREG = c;
}

void printString(unsigned char *s)
{
    while (*s) PPutch(*s++);
}
// input: a binary value in 0 - 15. Output: ASCII 0 - 9, A - F


void printvoltage(unsigned long int rslt2) {  //prints voltage
    unsigned char x1;
    unsigned char x2;
    unsigned char x3;
    unsigned char x4;
    unsigned char x5;


    x1 = rslt2 % 10;
    rslt2 /= 10;
    x2 = rslt2 % 10;
    rslt2 /= 10;
    x3 = rslt2 % 10;
    rslt2 /= 10;
    x4 = rslt2 % 10;
    rslt2 /= 10;
    x5 = rslt2 % 10;
    
                     //print ascii value of each digit of the voltage.
    PPutch(x5 + 48); //first digit
    PPutch(0x2E); // ascii decimal point
    PPutch(x4 + 48); //second digit
    PPutch(x3 + 48); //third digit
    PPutch(x2 + 48); //fourth digit
    PPutch(x1 + 48); //last digit
    PPutch(0x56); // ascii V
}

void printdeviation(unsigned long int rslt2) {  //prints stddev voltage
    unsigned char x1;
    unsigned char x2;
    unsigned char x3;
    unsigned char x4;



    x1 = rslt2 % 10;
    rslt2 /= 10;
    x2 = rslt2 % 10;
    rslt2 /= 10;
    x3 = rslt2 % 10;
    rslt2 /= 10;
    x4 = rslt2 % 10;
    
    PPutch(x4 + 48); //first digit
    PPutch(x3 + 48); //second digit
    PPutch(x2 + 48); //third digit
    PPutch(0x2E); // ascii decimal point
    PPutch(x1 + 48); //last digit
    PPutch('m');
    PPutch(0x56); // ascii V
}


void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;  // For digital I/O.  If you want to use analog, you'll
                       // need to change this.

    // add your configuration commands below
    // set up ADC
    AD1CON1 = 0;
    AD1CON2 = 0;
    AD1CON3 = 0;

    TRISAbits.TRISA0 = 1;
    TRISAbits.TRISA1 = 1;
    AD1PCFGbits.PCFG0 = 0;  // AN0 selected for analog input
    AD1PCFGbits.PCFG1 = 0;  // AN1 selected for analog input

// change so 1 channel and interrupt after every 1 sample
    AD1CSSL = 0;
    AD1CSSLbits.CSSL0 = 1;
    AD1CSSLbits.CSSL1 = 1;
    AD1CHS = 0;             // initial channel is 0
    AD1CON3bits.ADCS = 1;
    AD1CON3bits.SAMC = 1;
    AD1CON2bits.SMPI = 7;
    AD1CON1bits.SSRC = 0b010;
    AD1CON1bits.ASAM = 1;
    AD1CON1bits.ADON = 1;
    IPC3bits.AD1IP = 6;
    IFS0bits.AD1IF = 0;
    IEC0bits.AD1IE = 1;

    // set up Timer 2
    T3CON = 0;
    PR3 = 31;
    T3CONbits.TON = 1;
    TMR3 = 0;
    IFS0bits.T3IF = 0;

    // set up UART
    U1MODE = 0;
    U1BRG = 8; // 38400 baud,
    U1MODEbits.BRGH = 0;
    U1MODEbits.UEN = 0;
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;


    PPSUnLock;
    // serial port UCA1:  Uses RP4 and RP5
    PPSOutput(PPS_RP3, PPS_U1TX);
    PPSInput(PPS_U1RX, PPS_RP6);
    PPSLock;

}

int main(int argc, char *argv[])
{
    long int avg, sum, dev;
    int i;
    setup();

    PPutch(0x0D);
    PPutch(0x0A);
    printString((unsigned char*)"Voltage\t\tStdDev");   // displays the headings on the terminal
    PPutch(0x0D);
    PPutch(0x0A);
    AD1CON1bits.SAMP = 1;
    AD1CHS = 0;

    while (1)
    {
        dev = sum = avg = 0;
        for (i = 0; i < 512; i++)
            sum+=aBuff[i];

        printvoltage(sum /16);
        
        avg = sum / 512;
        
        printString((unsigned char*)"\t\t");
        
        for (i = 0; i < 512; i++)
            dev += (avg - aBuff[i])*(avg - aBuff[i]);
        dev = sqrt(dev);
        dev /= 16;
        
        printdeviation(dev);
        
        PPutch(0x0D);
    }

    return 0; // never reached (we hope)
}


