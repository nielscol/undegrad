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


unsigned char buffer[64];
unsigned char front = 0;
unsigned char back = 0;
volatile unsigned short int tBuff[64]; //used to store 64 temperature samples
volatile unsigned short int vBuff[64]; //used to store 64 voltage samples
unsigned short int bufferState;

void __attribute__((__interrupt__,__auto_psv__)) _ADC1Interrupt(void)
{
        IFS0bits.AD1IF = 0;
        if(current == 512)  //resets index if too high
            current = 0;
        aBuff[current] = ADC1BUF0; //stores ADC val to current sample index
        current++;
}


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

void printString(unsigned char *s)
{
    while (*s) PPutch(*s++);
}
// input: a binary value in 0 - 15. Output: ASCII 0 - 9, A - F


void printtemperature(unsigned long int rslt2) {  //prints voltage
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
    
                     //print ascii value of each digit of the voltage.
    PPutch(x4 + 48); //third digit
    PPutch(x3 + 48); //third digit
    PPutch(x2 + 48); //fourth digit
    PPutch('.');
    PPutch(x1 + 48); //last digit
    PPutch('\t'); // ascii tab
}
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
    PPutch(x5 + 48);
    PPutch('.');
    PPutch(x4 + 48); //third digit
    PPutch(x3 + 48); //third digit
    PPutch(x2 + 48); //fourth digit
    PPutch(x1 + 48); //last digit
}

void setup(void)
{
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;  // all pins digital to start
   
    AD1CON1 = 0;
    AD1CHS = 0;
    AD1PCFGbits.PCFG0 = 0;
    AD1PCFGbits.PCFG1 = 0;
    AD1CON2 = 0;
    AD1CON3bits.ADCS = 1; // Tad = 2*Tcy = 125ns
    AD1CON3bits.ADRC = 0;
    AD1CON3bits.SAMC = 3; // sample time = 375ns
    AD1CHSbits.CH0SA = 0; // channel selected is channel 0
	AD1CON1bits.SSRC = 0b111; // auto-conversion
    AD1CON1bits.ASAM = 0; // manual-sample
    AD1CON1bits.ADON = 1;
   
    // set up Timer 2
    T1CON = 0;
    T1CONbits.TCKPS = 3; //1:256 prescale
    PR1 = 62500; //1 second period
    TMR1 = 0;
    IFS0bits.T1IF = 0;
    T1CONbits.TON = 1;

    // set up UART
    U1MODE = 0;
    U1BRG = 103; // 38400 baud,
    U1MODEbits.BRGH = 0;
    U1MODEbits.UEN = 0;
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;
    U1STAbits.URXISEL= 0; //interrupt when character received
    IEC0bits.U1RXIE = 1;
    IPC2bits.U1RXIP = 6;


    PPSUnLock;
    // serial port UCA1:  Uses RP4 and RP5
    PPSOutput(PPS_RP3, PPS_U1TX);
    PPSInput(PPS_U1RX, PPS_RP6);
    PPSLock;

}

void sample(void)
{
    unsigned int i;
    for(i = 0; i < 64; i++){
        AD1CHSbits.CH0SA = 0;
        AD1CON1bits.SAMP = 1;
        while (!IFS0bits.AD1IF);
        IFS0bits.AD1IF = 0;
        tBuff[i] = ADC1BUF0;
        
        AD1CHSbits.CH0SA = 1;
        AD1CON1bits.SAMP = 1;
        while (!IFS0bits.AD1IF);
        IFS0bits.AD1IF = 0;
        vBuff[i] = ADC1BUF0;
    }
        
}

void print(void)
{
    long int tempi, volt;
    double tempf;
    int i;
    
    tempi= volt= 0;

    sample();

    for (i = 0; i < 64; i++)
        tempi+=tBuff[i];
    for (i = 0; i < 64; i++)
        volt+=vBuff[i];

    tempf = tempi;
    tempf /= 64.0;

    if(tempf > 100)
        tempf = 0.2493*tempf + 56.453;
    if(tempf <= 100)
        tempf = 34.127 * log(tempf)-76.321;
    tempf *=10;
    tempi = (long int)floor(tempf);
    printtemperature(tempi);
    printvoltage(volt / 6);

    PPutch('\r');
    PPutch('\n');
}

int main(int argc, char *argv[])
{
    char received, go = 0;
    setup();
/*
    PPutch(0x0D);
    PPutch(0x0A);
    printString((unsigned char*)"Temperature");   // displays the headings on the terminal
    PPutch(0x0D);
    PPutch(0x0A);
*/
    while (1)
    {
        if(front != back){
            received = buffer[back++];
            back %= 63;
            
            if(received = 'p'){
                go += 1;
                go %= 2;
            }

        }
        while(!IFS0bits.T1IF);
        IFS0bits.T1IF = 0;
        if(go == 1)
            print();
    }

    return 0; // never reached (we hope)
}


