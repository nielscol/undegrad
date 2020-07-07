
#include <p24Fxxxx.h>
#include <xc.h>
#include <PPS.h>

// PIC24FJ64GA002 Configuration Bit Settings
// 'C' source line config statements

// CONFIG2
#pragma config POSCMOD = NONE           // Primary Oscillator Select (Primary oscillator disabled)
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = OFF            // IOLOCK Protection (IOLOCK may be changed via unlocking seq)
#pragma config OSCIOFNC = ON           // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as CLKO (FOSC/2))
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

static unsigned int characters[4][5] = {    {0x0000, 0xFFFF, 0xF097, 0xF037, 0xF043},  //stores the values needed to
                                            {0x0000, 0xFFFF, 0xF127, 0xF107, 0xF003},  //display characters on PORTB
                                            {0x0000, 0xFFFF, 0xF007, 0xF067, 0xF18B},  //corresponding to each button
                                            {0x0000, 0xFFF3, 0xF00F, 0xF183, 0xF00B}};

static unsigned int scanValues[4] = { 0x73FF, 0xB3FF, 0xD3FF, 0xE3FF};
// values to put out on B 15-12

void setup(void){
    CLKDIVbits.RCDIV = 0;
    I2C1CON = 0;	// disable I2C
    AD1PCFG = 0x9fff;
    TRISA = 31; //all pins on port a = inputs
    TRISB = 0x0000; //all pins on port b = outputs
    CNPU1bits.CN2PUE = 1; //these pull up the inputs on port A
    CNPU1bits.CN3PUE = 1;
    CNPU1bits.CN0PUE = 1;
    CNPU2bits.CN29PUE = 1;
    CNPU2bits.CN30PUE = 1;
    
}

void msDelay(int a){
    
    T1CON=0;
    PR1 = 16000; //approx 1ms timer
    IFS0bits.T1IF=0;
    
    while(a > 0){
        TMR1 = 0;
        T1CONbits.TON = 1;
    
        while(IFS0bits.T1IF==0);
        IFS0bits.T1IF = 0;
        T2CONbits.TON = 0; 
        a--;
    }

}

void display(unsigned int displayValues[]){
    
    LATB &= displayValues[0];
    LATBbits.LATB10 = 1;
    msDelay(1);
    LATBbits.LATB10 = 0;
    
    LATB = displayValues[1];
    LATBbits.LATB11 = 1;
    msDelay(1);
    LATBbits.LATB11 = 0;
    
    LATB = 0xF3FF; 
}

unsigned int getKey(void){

    unsigned short x = 0;
    unsigned int y = 0;
    unsigned int none = 0;
    unsigned int i;
    
    for(i = 0; i < 4; i++){
        PORTB = scanValues[i];
        if(PORTAbits.RA0 == 0){
            x = 0;
            y = i;
            break;
        }
        else if(PORTAbits.RA1 == 0){
            x = 1;
            y = i;
            break;
        }
        else if(PORTAbits.RA2 == 0){
            x = 2;
            y = i;
            break;
        }
        else if(PORTAbits.RA3 ==  0){
            x = 3;
            y = i;
            break;
        }
        else if(i == 3)
            none = 1;
        
    }
    
    PORTB = 0xF3FF;
    
    if(none == 1)
        return 0xF3FF;
    
    return characters[x][y+1];

}

int main(void)
{
    setup(); //sets up timer and outputs
    PORTB = 0xF3FF; //sets output so both 7 seg's are off
    
    unsigned int displayValues[2] = {0xF3FF,0xF3FF};
    unsigned int returned;
    unsigned int i;
    
    while(1){
        returned = getKey();
        if(returned != 0xF3FF){
            displayValues[1] = displayValues[0];
            displayValues[0] = returned;
        }
        for(i = 0; i<100; i++)
             display(displayValues);
        
        
    }
}
