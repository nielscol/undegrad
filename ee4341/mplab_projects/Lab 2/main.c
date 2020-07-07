
#include <p18f4520.h>
#include <GenericTypeDefs.h>
#include <i2c.h>

//LATD7 PWR
//LATD6 EN
//LATD5 RW
//LATD4 RS

#define LCD_PWR     LATDbits.LATD7                ///< LCD ON/OFF line		
#define LCD_EN      LATDbits.LATD6               ///< LCD enable line
#define LCD_RW      LATDbits.LATD5                ///< LCD read/write line
#define LCD_RS      LATDbits.LATD4 				//reset

void WriteNybble(char Cmd, char Dat);
void WriteByte(char Cmd, char Dat);
void LCDClear(void);
void Wait(int i);
void initialize(void);

volatile unsigned char sdata;
volatile unsigned char count;

#pragma interruptlow low_priority_interrupt 

void low_priority_interrupt(void)
{
/******************************* SERIAL RECEPTION ***************************/

  if (PIR1bits.RCIF){   // if USART receice interrupt
    sdata = RCREG;      // save character received 
//	count++;

	Nop(); //little delay
	Nop();

	WriteByte(1, sdata);	//write received character to lcd
	TXREG = sdata;			//transmit received characted over UART



//	if(count = 16)	//if line 1 full advance to line 2
//		WriteByte(0, 0xC0);
//	else if(count = 32){ //if line 2 full return to line 1
//		WriteByte(0, 0x02);
//		count = 0;
//	}
  } 
}


void main( void) {
	
	char data;
	count = 0;

	TRISB = 0x00;
	PORTB = 0xFF;
	
	initialize();

	 OpenI2C(MASTER, SLEW_ON);// Initialize I2C module
	 SSPADD = 9; //100kHz Baud clock(9) @4MHz

	while(1){
	HDByteWriteI2C(0b10100000, 0x00, 0x01, 0x42);	//writes received RS232 character to EEPROM
	Delay10KTCYx(10);	//wait >15ms for LCD to stabilize
}
}

void WriteNybble(char RS, char Dat)
{
	char buf;

	if(RS)		//command to be written
		LCD_RS = 1;	//Write data
	else
		LCD_RS = 0; // Instruction reg

	LCD_EN = 0;
	LCD_RW = 0;            // Set write mode

	buf =LATD;                  	// Get high/address nybble
	buf &= 0xF0;                  	// Clear the low nybble
	LATD = buf | (Dat & 0x0F);   	// Combine address nybble and data nybble 

	Delay10TCYx(1);		//pulse E line 0-1-0
	LCD_EN = 1;
	Delay10TCYx(1);	
	LCD_EN = 0;
}

void WriteByte(char RS, char Dat)
{
	WriteNybble(RS, Dat >> 4);            // send high nybble
	Delay100TCYx(2);
	WriteNybble(RS, Dat);                 // send the low nybble
}

void initialize (void){

	TRISCbits.TRISC3 = 0;
	TRISCbits.TRISC4 = 0;
//init i2c

	
//*************Set up LCD ******************//
	TRISD = 0;
	PORTD = 0;

	PORTDbits.RD6 = 0;
	PORTDbits.RD4 = 0;

	//power up sequence

	Delay100TCYx(3);	//wait for power to stabilize
	PORTDbits.RD7 = 1; 	//turn on LCD
	Delay10KTCYx(6);	//wait >15ms for LCD to stabilize

	WriteNybble(0,0x03); //send 8 bit function set
	Delay10KTCYx(2);  	//wait >4.1ms
	WriteNybble(0,0x03); //repeat 8 bit command
	Delay100TCYx(4);	//wait > 100us
	WriteNybble(0,0x03); //repeat 8 bit command again
	Delay100TCYx(2);	//wait ~50us

	//set up sequence
	WriteNybble(0,0x02); //set to 4 bit mode
	Delay100TCYx(2);	//wait ~50us
	WriteByte(0,0x28); //function set
	Delay100TCYx(2);	//wait ~50us
	WriteByte(0,0x0E); //turn display on
	Delay100TCYx(2);	//wait ~50us
	WriteByte(0,0x06); //entry mode set to shift cursor right
	Delay100TCYx(2);	//wait ~50us

//*************Set up USART*******************//
}
