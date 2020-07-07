
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
volatile unsigned int front = 0;
volatile unsigned int back = 0;
unsigned short int aBuff[512]; //used to store the 512 samples of the ADC
unsigned short int bufferState;


void __attribute__((__interrupt__,__auto_psv__)) _U1RXInterrupt(void)
{

    IFS0bits.U1RXIF = 0;
    buffer[front++] = U1RXREG;
    front &= 63;
}

void PPutch(const unsigned char c)
{
    unsigned short int tmp = 5000;
    while (tmp--) tmp = tmp;

    IFS0bits.U1TXIF = 0;
    U1TXREG = c;
}

unsigned char PGetch(void)
{
    unsigned char x;

    while (front == back) ;
    x = buffer[back++];
    back &= 63;
    return x;
}

void printString(unsigned char *s)
{
    while (*s) PPutch(*s++);
}
// input: a binary value in 0 - 15. Output: ASCII 0 - 9, A - F

void setup(void)
{
    CLKDIVbits.RCDIV = 0;

    
    // set up UART
    U1MODE = 0;
    U1BRG = 103; // 38400 baud,
    U1MODEbits.BRGH = 0;
    U1MODEbits.UEN = 0;
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;

    PPSUnLock;
    // serial port UCA1:  Uses RP4 and RP5
    PPSOutput(PPS_RP3, PPS_U1TX);
    PPSInput(PPS_U1RX, PPS_RP6);
    PPSLock;
    IFS0bits.U1RXIF = 0;
    IEC0bits.U1RXIE = 1;

}

int main(void)
{
    char returned;
    int i = 0;

    setup();

    PPutch('\f');
    for(i = 0; i<80; i++)
        PPutch('*');
    printString((unsigned char*)"\n\r");
    for(i = 0; i<38; i++)
        PPutch('*');    
    printString((unsigned char*)"TEST");
    for(i = 0; i<38; i++)
        PPutch('*');   
    for(i = 0; i<80; i++)
        PPutch('*');
    printString((unsigned char*)"\r\n\n");


    while(1){
        returned = PGetch();
        if(returned == '\r')
            printString((unsigned char*)"\r");
        else if (returned == '\e')
            PPutch('\f');
        else if (returned == ':'){
            PPutch(':');
            if(PGetch() == 'p')
                PPutch('p');
                if(PGetch() == '\r'){
                    PPutch('\r');
                    PPutch('\n');
                    for(i = 0; i<80; i++)
                        PPutch('*');
                    printString((unsigned char*)"\r\n\n");
                    
                }
                    
        }
            
            

        else PPutch(returned);
                    
    }
    
    return 0; // never reached (we hope)
}


