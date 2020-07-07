/* 
 * File:   main.c
 * Author: cole
 *
 * Created on February 8, 2016, 6:09 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <p18f4520.h>
#include <GenericTypeDefs.h>
//LATD7 PWR
//LATD6 EN
//LATD5 RW
//LATD4 RS

#define LCD_PWR     LATDbits.LATD7                ///< LCD ON/OFF line		
#define LCD_EN      LATDbits.LATD6               ///< LCD enable line
#define LCD_RW      LATDbits.LATD5                ///< LCD read/write line
#define LCD_RS      LATDbits.LATD4 //reset
#define TRUE	1
#define FALSE	0

void WriteNibble(char Cmd, char Dat);
void WriteByte(char Cmd, char Dat);
void LCDClear(void);
void Wait(void);
void initialize(void);

void main( void) {
	
	char data;

	TRISB = 0x00;
	PORTB = 0xFF;
	while(1);

	initialize();

	PIR1bits.RCIF = 0;
		
	WriteByte(FALSE, 0x41); 	

	while(1){
		while(!PIR1bits.RCIF);
		data = RCREG;
		PIR1bits.RCIF = 0;

		WriteByte(FALSE, data);
		
	}
}

void WriteNibble(char Cmd, char Dat)
{
	char buf;

	if(Cmd)		//command to be written
		LCD_RS = 0;	//set RS for instruction reg
	else
		LCD_RS = 1; // Otherwise we are writing data

	LCD_RW = 0;            // Set write mode
	LCD_EN = 1;            // Disable LCD

	LATDbits.LATD0 = LATDbits.LATD1 = LATDbits.LATD2 = LATDbits.LATD3= 0;    // Clear the data lines
	Nop();                                       			// Small delay
	Nop();

	buf =LATD;                   	// Getting the high nibble
	buf &= 0xF0;                  // Clear the low nibble
	LATD = buf | (Dat & 0x0F);   	// Combine & write back to the data lines
	Nop();                      	// Give the data a small delay to settle
	Nop();

	LCD_EN = 0; 	          // Enable LCD  -- active edge is when En transitions     
}

void WriteByte(char Cmd, char Dat)
{
	WriteNibble(Cmd, Dat >> 4);            // Output the high nibble to the LCD
	WriteNibble(Cmd, Dat);                 // Now send the low nibble
}

void LCDClear(void)
{
  WriteByte(TRUE,0x01);                       // Send clear display command
  Wait();                                  // Wait until command is finished
}

void Wait(void) //delay for LCD write
{
	char i, j;

	for (i = 0; i < 5; i++)
		for (j = 0; j < 5; j++)
			Nop();
		
}								  // from high to low?

void initialize (void){
	TRISD = 0;
	LATD = 0;
	
	LCD_PWR = 1; //turn LCD on
	LCD_RS = 0;  //Set to command
	LCD_RW = 0;  //set write
	LCD_EN = 1;  //set high
	LCD_RS = 0;  //goes low (active edge)

	Wait();
	WriteNibble(TRUE,0x02); //sets to 4 bit op
	Wait();
	WriteNibble(TRUE,0x02);
	Wait();
	WriteNibble(TRUE,0x08);
	Wait();
	WriteNibble(TRUE,0x00);
	Wait();
	WriteNibble(TRUE,0x0C);
	Wait();
	WriteNibble(TRUE,0x00);
	Wait();
	WriteNibble(TRUE,0x01);
	Wait();
	WriteNibble(TRUE,0x00);
	Wait();
	WriteNibble(TRUE,0x02);
	Wait();
	WriteNibble(TRUE,0x04);
	Wait();
	WriteNibble(TRUE,0x0E);
	Wait();

	// Reset USART registers to POR state
	TXSTA = 0;          
	RCSTA = 0;
  
  	// Continuous or single reception
	RCSTAbits.CREN = 1; //enables rx
	RCSTAbits.SPEN = 1;  // Enable receiver

	TXSTAbits.SYNC = 0;	// Sync or async operation
	BAUDCONbits.BRG16 = 0; //8 bit BRG reg
	TXSTAbits.BRGH = 0; //baud rate generator speed

	SPBRG = 12;       // Write baudrate to SPBRG
						//fosc/[64(n+1)] -- 12 = 19200 baud

	PIE1bits.RCIE = 1; //interrupt on receive enable (0 - disabled)
	PIE1bits.TXIE = 0;// Interrupt on transmission (0 - disabled)

	INTCONbits.GIE = 1; //Global interrupt enable
	INTCONbits.PEIE = 1; //Peripheral interrupt enable

	//(0) 8- or (1) 9-bit mode
	TXSTAbits.TX9 = 0;	
	RCSTAbits.RX9 = 0;

	TXSTAbits.TXEN = 1;  // Enable transmitter


	TRISCbits.TRISC6 = 0; //sets Tx to output
	TRISCbits.TRISC7 = 1; //sets Rx to input
//	if(TXSTA1bits.SYNC && !TXSTA1bits.CSRC)	//synchronous  slave mode
//		TRISCbits.TRISC6 = 1;
}