
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

static unsigned int number[10] =    {0xF00B, 0xF27F, 0xF097,   //stores the values needed to
                                     0xF037, 0xF19F, 0xF127,   //display 0-9 on PORTB
                                     0xF107, 0xF267, 0xF007,   
                                     0xF067};

static unsigned int x = 0x330E; //random number seed

void setup(void){
    CLKDIVbits.RCDIV = 0;
    AD1PCFG = 0x9fff;
    TRISA = 31; //all pins on port a = inputs
    TRISB = 0x0003; //all pins on port b = outputs
    CNPU1bits.CN2PUE = 1; //these pull up the inputs on port A
    CNPU1bits.CN3PUE = 1;
    CNPU2bits.CN29PUE = 1;
    CNPU2bits.CN30PUE = 1;
    
    T2CON = 0;
    T2CONbits.TCKPS = 3;
}

volatile unsigned int randNum = 0xAAAA;

unsigned int rand9000(void){
    int t;
    
    x = (x*0x5DEECE66D + 11) % 65536; //linear congruential form. for 16 bit int
    
    t = x % 9000;
    t += 1000;
    
    return t;
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
        T1CONbits.TON = 0; //changed
        a--;
    }

}

int getTime(){ 
    TMR2 = 0;
    T2CONbits.TCKPS = 3;
    T2CONbits.TON = 1;
    
    while (PORTAbits.RA1 == 1);
    T2CONbits.TON = 0;
    return TMR2;
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


int main(void)
{
    setup(); //sets up timer and outputs
    LATB = 0xF3FF; //sets output so both 7 seg's and LED are off
    unsigned int displayValues[2] = {0xF3FF,0xF3FF}; //stores display values
    signed int onTime;
    signed int offTime;
    signed int difference;
    unsigned int blink = 0;
    unsigned int i = 0;
    
    while(PORTAbits.RA1 == 1);
    
    while(1){
        LATB = 0xF3FF; //clear display and LED
        msDelay(rand9000());
        LATBbits.LATB15 = 0; //turn LED on
        onTime = getTime(); //gets
        msDelay(rand9000());
        LATBbits.LATB15 = 1;
        offTime = getTime();
        
        difference = onTime - offTime;
        
        difference /= 625; 
        
        if (difference > 9){
            displayValues[0] = 0xF274;
            displayValues[1] = 0xF3F4;
            blink = 1;
        }
        else if(difference < -9){
            displayValues[0] = 0xF3F4;
            displayValues[1] = 0xF3F4;
            blink = 1;
        }
        else if(difference < 0){
            difference *= -1;
            displayValues[0] = 0xF3F4;
            displayValues[1] = number[difference];
            blink = 0;
        }
        
        else{
            displayValues[0] = 0xF3FF;
            displayValues[1] = number[difference];
            blink = 0;
        }
        
        if (PORTAbits.RA1 == 0)
            while(PORTAbits.RA1 == 0);
        
        while (PORTAbits.RA1 == 1){
            if(blink == 0){
                display(displayValues);
            }
        
            if(blink == 1){
                for (i = 0; i < 250; i++)
                    display(displayValues);
                    if(PORTAbits.RA1 == 0)
                        break;
                LATB = 0xE3FF;
                for (i = 0; i<20; i++){
                    msDelay(25);
                    if(PORTAbits.RA1 == 0)
                        break;
                }
            }
        }    
        
        
        
    }
}
