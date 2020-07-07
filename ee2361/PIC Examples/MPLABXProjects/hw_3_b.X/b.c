
#include <p24Fxxxx.h>
#include <xc.h>
#include <PPS.h>

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

// Goal: to generate a signal with 400us high cycle, 600us low.
// Method: use single output pulse generation in a loop.
// Calculations: period = 1ms, so PR2 = 15,999
//               hi start = 1 = OC1R, low start = 1+0.4*16000 = 6,399 = OC1RS
// We do one pulse, then on T2IF, we check to see if we want
// another pulse (e.g., if the user has kept pressing a key)
// Use Window > Simulator > Analyzer to see the output.
// NOTE: the DEBUG option will use smaller values in PR2 and OC registers for
// debugging purposes

void __attribute__((__interrupt__,__auto_psv__)) _U1RXInterrupt(void)
{

    IFS0bits.U1RXIF = 0;
    buffer[front++] = U1RXREG;
    front &= 63;
}

void setup()
{
    PPSUnLock;
    PPSOutput(PPS_RP3,PPS_OC1);
    PPSLock;

    T2CON = 0;      //Set timer2
    PR2 = 15999; // 1ms
    TMR2 = 0;
    IFS0bits.T2IF = 0;

    OC1CON = 0; 
    IFS0bits.OC1IF = 0;
    OC1R = 1599;    //initial compare value, proportional to 0.1 ms
    OC1RS = 4799;   //second compare value, proportional to 0.3 ms
    OC1CONbits.OCTSEL = 0; //use TMR2
    OC1CONbits.OCM = 6; //OC pin start high, go low at compare event

    T2CONbits.TON = 1;
    
        // set up UART
    U1MODE = 0;
    U1BRG = 8; // 38400 baud,
    U1MODEbits.BRGH = 0;
    U1MODEbits.UEN = 0;
    U1MODEbits.UARTEN = 1;
    U1STAbits.UTXEN = 1;


    PPSUnLock;
    // serial port UCA1:  Uses RP4 and RP5
    PPSOutput(PPS_RP4, PPS_U1TX);
    PPSInput(PPS_U1RX, PPS_RP5);
    PPSLock;
}

int main(void)
{
    setup();

    while (1){
        while (!IFS0bits.T2IF); //wait until 
        IFS0bits.T2IF = 0;
        OC1RS += 3200;      //increment compare value proportional to 0.2 ms
        if(OC1RS > 14399)   //reset compare value back to 0.1 ms after 0.9 ms
            OC1RS = 1599;
        Nop();      //breakpoint
    }
}
