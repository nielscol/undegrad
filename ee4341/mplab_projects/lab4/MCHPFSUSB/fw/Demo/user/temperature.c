/*********************************************************************
 *
 *                Thermo Sensor with SPI(TM) Interface
 *
 *********************************************************************
 * FileName:        temperature.c
 * Dependencies:    See INCLUDES section below
 * Processor:       PIC18
 * Compiler:        C18 3.11+
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * The software supplied herewith by Microchip Technology Incorporated
 * (the “Company”) for its PICmicro® Microcontroller is intended and
 * supplied to you, the Company’s customer, for use solely and
 * exclusively on Microchip PICmicro Microcontroller products. The
 * software is owned by the Company and/or its supplier, and is
 * protected under applicable copyright laws. All rights are reserved.
 * Any use in violation of the foregoing restrictions may subject the
 * user to criminal sanctions under applicable laws, as well as to
 * civil liability for the breach of the terms and conditions of this
 * license.
 *
 * THIS SOFTWARE IS PROVIDED IN AN “AS IS” CONDITION. NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 * TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 * IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 * Author               Date        Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Rawin Rojvanit       11/19/04    Original.
 * Fritz Schlunder		08/20/07	Added PollTempOnHPCExplorer() function,
 *									and other changes for PIC18F87J50 PIM
 ********************************************************************/

/** I N C L U D E S **********************************************************/
#include <p18cxxx.h>
#include "system\typedefs.h"
#include <spi.h>
#include "io_cfg.h"
#include "user\temperature.h"

/** V A R I A B L E S ********************************************************/
#pragma udata
unsigned int I2CStateVariable;	// Used for keeping track of the I2C state
								// machine when using the HPC Explorer board's
								// I2C based TC74 temperature sensor.
signed char TempAccumulator;	// Used for averaging temperature samples
signed char TempSave;
WORD temperature;           	// Raw data format
char tempString[10];        	// Buffer for storing data in ASCII format

/** P R I V A T E  P R O T O T Y P E S ***************************************/

/** D E C L A R A T I O N S **************************************************/
#pragma code
/******************************************************************************
 * Function:        void InitTempSensor(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Initializes SPI interface & chip select line
 *
 * Note:            None
 *****************************************************************************/
void InitTempSensor(void)
{
	#if defined(PIC18F4550_PICDEM_FS_USB)
    cs_temp_sensor = 1;
    tris_cs_temp_sensor = OUTPUT_PIN;
    OpenSPI(SPI_FOSC_64, MODE_11, SMPMID);
    
    // Initialize readable values - default to room temperature
    temperature._word = 0x0C87;       // 25 degree celsius
    UpdateCelsiusASCII();
    
	#elif defined(PIC18F87J50_FS_USB_PIM)
    temperature._word = 0x0C87;       // 25 degree celsius
    UpdateCelsiusASCII();

	//Need to initialize I2C Module to prepare for communication with
	//TC74 temperature sensor on the HPC Explorer board.
	mInitI2CPins();				// See io_cfg.h
	SSP1STAT = 0xC0;			// Slew rate control disabled, SMBus
	SSP1CON1 = 0x08;			// I2C Master mode
	SSP1CON2 = 0x00;
	SSP1ADD = 0x7D;				// Just under 100kHz at 48MHz core frequency
	SSP1CON1bits.SSPEN = 1;		// Enable MSSP module	

	I2CStateVariable = 0;		// Initial state for I2C state machine

	#else
		#error Need to define the board.
	#endif

}//end InitTempSensor

/******************************************************************************
 * Function:        BOOL AcquireTemperature(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        None
 *
 * Note:            None
 *****************************************************************************/
BOOL AcquireTemperature(void)
{
	//The PICDEM FS USB Demo Board uses a TC77 (13 bit) temperature sensor and
	//communicates with it through the SPI interface.
	#if defined(PIC18F4550_PICDEM_FS_USB)	
    cs_temp_sensor = 0;
    MSB(temperature) = ReadSPI();
    LSB(temperature) = ReadSPI();
    cs_temp_sensor = 1;
    
    if(temperature.LowB.b2 == 0)		// Bit 2 is special, see datasheet for
        return FAIL;					// TC77 temperature sensor for details.

    return OK;

	//The PIC18F87J50 FS USB Plug-In Module (PIM) does not have a temperature 
	//sensor, but there is a TC74 (8 bit) I2C based temperature sensor on the
	//HPC Explorer demo board.  In order for this temperature demo code to do 
	//anything useful, the PIM should be used in conjunction with the HPC Explorer.
	//The TC74 comes in 5V and 3.3V optimized versions.  If a 5V part is run at
	//3.3V (as with the PIM installed), it may have relatively large offsets.
	#elif defined(PIC18F87J50_FS_USB_PIM)	// Uses TC74 (8 bit) 
	return OK;		// Don't need to do anything in this function, temperature
					// polling with the PIC18F87J50 FS USB Plug-In Module is
					// done with the PollTempOnHPCExplorer() function.
					// This is done so the I2C communication can be done with
					// a non-blocking approach.


	//#elif defined(YOUR_BOARD)
	//Add code specific for your hardware platform

	#else
		#Error Unknown temperature acquire configuration.  See AcquireTemperature function in __FILE__
	#endif
}//end AcquireTemperature



/******************************************************************************
 * Function:        void PollTempOnHPCExplorer(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          Temperature data from TC74 on HPC Explorer, but formatted 
 *					like the TC77, stored in the "temperature" variable.
 * Side Effects:    None
 *
 * Overview:        None
 *
 * Note:            None
 *****************************************************************************/
void PollTempOnHPCExplorer(void)
{
	//The PIC18F87J50 FS USB Plug-In Module (PIM) does not have a temperature 
	//sensor, but there is a TC74 (8 bit) I2C based temperature sensor on the
	//HPC Explorer demo board.  In order for this temperature demo code to do 
	//anything useful, the PIM must be used in conjunction with the HPC Explorer.
	//The TC74 comes in 5V and 3.3V optimized versions.  If a 5V part is run at
	//3.3V (as with the PIM installed), it may have relatively large offsets.
	#if defined(PIC18F87J50_FS_USB_PIM)		 
	#define TC74AddressWrite	0b10011010	// This is the default address for the TC74, use this for writes
	#define TC74AddressRead		0b10011011	// This is the default address for the TC74, use this for reads
	#define RTR 				0x00		// This is the read temp command for TC74

	// Should not use blocking functions in USB code.  Therefore, these I2C
	// communications are done with a state machine as shown below.
	switch(I2CStateVariable)
	{
		case 0x00:
			PIR1bits.SSP1IF = 0;
			SSP1CON2bits.SEN = 1;				// Send Start Bit
			I2CStateVariable = 0x01;
			break;
		case 0x01:
			if(PIR1bits.SSP1IF == 0) {break;}
			PIR1bits.SSP1IF = 0;
			SSP1BUF = TC74AddressWrite;			// Begin sending the actual address
			I2CStateVariable = 0x02;
			break;
		case 0x02:
			if(PIR1bits.SSP1IF == 0) {break;}
			PIR1bits.SSP1IF = 0;
			SSP1BUF = RTR;						// Send command to select the TEMP register
			I2CStateVariable = 0x03;
			break;
		case 0x03:
			if(PIR1bits.SSP1IF == 0) {break;}
			PIR1bits.SSP1IF = 0;
			SSP1CON2bits.SEN = 1;				// Send another start bit
			I2CStateVariable = 0x04;
			break;
		case 0x04:
			if(PIR1bits.SSP1IF == 0) {break;}
			PIR1bits.SSP1IF = 0;
			SSP1BUF = TC74AddressRead;			// Send the address again, but this time "read"
			I2CStateVariable = 0x05;
			break;
		case 0x05:
			if(PIR1bits.SSP1IF == 0) {break;}
			PIR1bits.SSP1IF = 0;
			SSP1CON2bits.RCEN = 1;				// Initiate read from device
			I2CStateVariable = 0x06;
			break;
		case 0x06:
			if(PIR1bits.SSP1IF == 0) {break;}
			PIR1bits.SSP1IF = 0;
			TempSave = SSP1BUF;					// Finally got the result, need to save it
			SSP1CON2bits.ACKDT = 1;				// Prepare I2C NACK handshake
			SSP1CON2bits.ACKEN = 1;				// Send the acknowledge bit
			I2CStateVariable = 0x07;
			break;
		case 0x07:
			if(PIR1bits.SSP1IF == 0) {break;}
			PIR1bits.SSP1IF = 0;
			SSP1CON2bits.PEN = 1;				// Now send a stop bit
			I2CStateVariable = 0x08;
			break;
		case 0x08:
			if(PIR1bits.SSP1IF == 0) {break;}
			PIR1bits.SSP1IF = 0;
			I2CStateVariable = 0x09;
			break;
		case 0x09:
			TempAccumulator = ((TempAccumulator + TempSave) / 2);	// Get an average
			I2CStateVariable = 0x10;
			break;
		case 0x10:
			//Now format data like that of the TC77, which is what the PC side code expects,
			//since it was originally intended to be used with the TC77.
			MSB(temperature) = TempAccumulator;
			if(temperature.HighB.b7 == 0)		// == 0 when positive temperature
			{
			temperature._word = temperature._word >> 1;
			temperature.HighB.b7 = 0;			// Positive temperature, upper MSb clear
			}
			else
			{
			temperature._word = temperature._word >> 1;
			temperature.HighB.b7 = 1;			// Negative temperature, upper MSb set
			}
			temperature.LowB.b0 = 1;			// Lower three LSbs = 1 on TC74 format
			temperature.LowB.b1 = 1;			// Lower three LSbs = 1 on TC74 format
			temperature.LowB.b2 = 1;			// Lower three LSbs = 1 on TC74 format

			I2CStateVariable = 0x11;			// Could go back to 0, but don't want to poll that fast
			break;
		case 0x5000:							// This slows down the sample rate of the device.
			I2CStateVariable = 0x00;			// The temp sensor itself only updates around 8 times/sec.
			break;
        default:
			I2CStateVariable++;
            break;	
    }//end switch

	#else
		return;
	#endif
}//end PollTempOnHPCExplorer



/******************************************************************************
 * Function:        void UpdateCelsiusASCII(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        This routine converts data output to ASCII string
 *
 * Note:            None
 *****************************************************************************/
void UpdateCelsiusASCII(void)
{
    WORD temp;
    byte i;
        
    temp._word = temperature._word >> 3;
    
    if(temp.HighB.b4 == 0)
    {
        temp.HighB._byte &= 0b00011111;
        tempString[0] = '+';
    }
    else
    {
        temp.HighB._byte |= 0b11100000;
        tempString[0] = '-';
        temp._word = temp._word ^ 0xFFFF;   // Negate
        temp._word++;
    }//end if

    temp._word = (temp._word*10U) >> 4;     // Turn into celsius xx.x
    
    /* Populate string */
    for(i=4;i>0;i--)
    {
        tempString[i] = (((char)(temp._word % 10)) & 0x0F) | 0x30;
        temp._word /= 10;
    }//end for
    
    /* Turn leading zeros into spaces */
    if(tempString[1] == '0')
    {
        tempString[1] = ' ';
        if(tempString[2] == '0')
            tempString[2] = ' ';
    }//end if
    
    /* Adjust decimal digit */
    tempString[5] = tempString[4];
    tempString[4]='.';
    tempString[6]=0xF8;     // Degree symbol
    tempString[7]='C';
    tempString[8]='\r';
    tempString[9]=0x00;     // Null-Terminated
    
}//end UpdateCelsiusASCII

/** EOF temperature.c ********************************************************/
