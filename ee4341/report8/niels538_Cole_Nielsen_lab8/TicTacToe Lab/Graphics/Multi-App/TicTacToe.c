/*****************************************************************************
 * FileName:        TicTacToe.c
 * Description: 	This is the main TicTacToe game file. 
******************************************************************************/
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "Compiler.h"

#include "GenericTypeDefs.h"
#include "HardwareProfile.h"
#include "TimeDelay.h"
#include "Graphics/Graphics.h"

#include "SST25VF016.h"
#include "TouchScreen.h"

#include "TTT_Images.h"

//Configuration Bits
#pragma config FPLLODIV = DIV_2, FPLLMUL = MUL_20, FPLLIDIV = DIV_1, FWDTEN = OFF, FCKSM = CSECME, FPBDIV = DIV_2
#pragma config OSCIOFNC = ON, POSCMOD = XT, FSOSCEN = ON, FNOSC = PRIPLL
#pragma config CP = OFF, BWP = OFF, PWP = OFF

/////////////////////////////////////////////////////////////////////////////
//                                MACROS
/////////////////////////////////////////////////////////////////////////////
#define WAIT_UNTIL_FINISH(x)    while(!x) //use around primitive drawing functions 

/////////////////////////////////////////////////////////////////////////////
//                            LOCAL PROTOTYPES
/////////////////////////////////////////////////////////////////////////////
void InitializeBoard(void);
void Init_CPUClocks(void);
void TickInit(void);

/////////////////////////////////////////////////////////////////////////////
//                               IMAGES USED
/////////////////////////////////////////////////////////////////////////////
extern const IMAGE_FLASH       	TTTX; //X image
extern const IMAGE_FLASH       	TTTO; //O image

/////////////////////////////////////////////////////////////////////////////
//                          GLOBAL VARIABLES
/////////////////////////////////////////////////////////////////////////////
volatile DWORD      tick = 0;                           // tick counter
volatile int press[9]; //keeps track of plays
volatile XCHAR win[] = {'W','i','n','s',0};
volatile XCHAR lose[] = {'L','o','s','e','s',0};
volatile XCHAR draw[] = {'D','r','a','w',0};
/////////////////////////////////////////////////////////////////////////////
//                                  MAIN
/////////////////////////////////////////////////////////////////////////////
int main(void)
{

    int j;

    for (j = 0; j<9; j++) press[j]=0; //clears play array

    XCHAR Str[] = {'R','e','s','e','t',0};
    XCHAR turn[] = {'T','u','r','n',0};

    GOL_MSG msg; // GOL message structure to interact with GOL


        GOL_SCHEME* rScheme; // reset button scheme

        rScheme = GOLCreateScheme(); // Create alternative style
        // scheme
        rScheme->TextColor0 = WHITE; // set text color 0
        rScheme->TextColor1 = WHITE; // set text color 1
        rScheme->Color0 = BLUE; // set text color 0
        rScheme->Color1 = BLUE; // set text color 1
        rScheme->EmbossDkColor = BLUE;     // Emboss dark color used for 3d effect.
        rScheme->EmbossLtColor = BLUE;

        GOL_SCHEME* gridScheme; // tic tac toe grid button scheme

        gridScheme = GOLCreateScheme(); // Create alternative style
        // scheme
        gridScheme->TextColor0 = BLACK; // set text color 0
        gridScheme->TextColor1 = BLACK; // set text color 1
        gridScheme->Color0 = WHITE; // set text color 0
        gridScheme->Color1 = WHITE; // set text color 1
        gridScheme->EmbossDkColor = WHITE;     // Emboss dark color used for 3d effect.
        gridScheme->EmbossLtColor = WHITE;

   	InitializeBoard(); //Initialize everything for the display
	SetColor(WHITE);

	ClearDevice();
        SetColor(BLACK);
        while(!Bar(78, 0, 82, GetMaxY()));
        while(!Bar(158, 0, 162, GetMaxY()));
        while(!Bar(0, 78, 240, 82));
        while(!Bar(0, 158, 240, 162));


        BtnCreate(  10, // reset
        240, 200, GetMaxX(), GetMaxY(), // Object's dimension
        NULL,
        BTN_DRAW, // set state of the object:
        // draw the object
        NULL, // no bitmap used
        Str, // use this text
        rScheme);

        BtnCreate(  11, // turn text
        240, 0, GetMaxX(), 39, // Object's dimension
        NULL,
        BTN_DRAW, // set state of the object:
        // draw the object
        NULL, // no bitmap used
        turn, // use this text
        gridScheme);

        BtnCreate(  12, // turn display
        240, 40, GetMaxX(), 100, // Object's dimension
        NULL,
        BTN_DRAW, // set state of the object:
        // draw the object
        &TTTX, // no bitmap used
        NULL, // use this text
        gridScheme);

        BtnCreate(  13, // win /lose/draw button
        240, 101, GetMaxX(), 140, // Object's dimension
        NULL,
        BTN_DRAW, // set state of the object:
        // draw the object
        NULL, // no bitmap used
        NULL, // use this text
        gridScheme);

        BtnCreate(  1, // 1st Button ID
                    0, 0, 77, 77,NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);
        BtnCreate(  2, //
                    82, 0, 157, 77,NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);
        BtnCreate(  3, // 
                    162, 0, 239, 77,NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);
        BtnCreate(  4, // 
                    0, 82, 77, 157,NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);
        BtnCreate(  5, // 
                    82, 82, 157, 157,NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);
        BtnCreate(  6, // 
                    162, 82, 239, 157,NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);
        BtnCreate(  7, // 
                    0, 162, 77, GetMaxY(),NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);
        BtnCreate(  8, // 
                    82, 162, 157, GetMaxY(),NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);
        BtnCreate(  9, //
                    162, 162, 239, GetMaxY(),NULL, // Object's dimension
                    BTN_DRAW, // set state of the object:
                    // draw the object
                    NULL, // no bitmap used
                    NULL, // use this text
                    gridScheme);

     //   Bar(SHORT left, SHORT top, SHORT right, SHORT bottom);
    //    Bar(SHORT left, SHORT top, SHORT right, SHORT bottom);
     //   Bar(SHORT left, SHORT top, SHORT right, SHORT bottom);
	//////////////////////////////////////
	//INSERT MAIN CODE AND GOL LOOP HERE//
	//////////////////////////////////////

        while(1){
              if(GOLDraw()){
                  TouchGetMsg(&msg);
                  GOLMsg(&msg);
              }
        }
}

/////////////////////////////////////////////////////////////////////////////
//                      TICTACTOE GAME FUNCTIONS
/////////////////////////////////////////////////////////////////////////////
/************************************************************************
 Function: WORD GOLMsgCallback(WORD objMsg, OBJ_HEADER* pObj, GOL_MSG* pMsg)

 Overview: This function must be implemented by user. GOLMsg() function 
 		   calls it each time the valid message for the object received.
           
 Input: objMsg - translated message for the object,
        pObj - pointer to the object,
        pMsg - pointer to the non-translated, raw GOL message 

 Output: If the function returns non-zero the message will 
 		 be processed by the object directly affected by the message.
 		 Default action on the object based on the message will be 
 		 performed.
************************************************************************/
WORD GOLMsgCallback(WORD objMsg, OBJ_HEADER *pObj, GOL_MSG *pMsg)
{
       WORD objectID;
       BUTTON *buttonObj;
       STATICTEXT *stObj;
       int i;
       int state = 0;

       for(i = 0; i<9; i++){
           if (press[i] != 0)
               state ^= 1;
       }

       buttonObj = (BUTTON*)GOLFindObject(12);
       if(state == 0)
            BtnSetBitmap(buttonObj, &TTTX);
       else BtnSetBitmap(buttonObj, &TTTO);

       objectID = GetObjID(pObj);
       if(objectID == 10){
           if (objMsg == BTN_MSG_PRESSED){
               for(i = 1; i<10; i++){
                  buttonObj = (BUTTON*)GOLFindObject(i);
                  BtnSetBitmap(buttonObj, NULL);
               }
                  for (i = 0; i<9; i++) press[i]=0;
           }
       }

       if(objectID<=9){
           if (objMsg == BTN_MSG_PRESSED){
                if((state == 0)&(press[objectID-1]==0)){
                    press[objectID-1]=1;
                    BtnSetBitmap(pObj, &TTTX);
                }
                else if((press[objectID-1]==0)){
                    press[objectID-1]=2;
                    BtnSetBitmap(pObj, &TTTO);
                }
           }
       }
                     // BtnSetBitmap(pObj, &TTTX);

       if((press[0]==press[1])&(press[1]==press[2])&(press[0]!=0)){
           if(state == 0){
               stObj = (STATICTEXT*)GOLFindObject(13);
               StSetText(stObj, win);
           }

       }

	return(1);
}

/************************************************************************
 Function: WORD GOLDrawCallback()

 Overview: This function must be implemented by user. GOLDraw() function 
 		   calls it each time when GOL objects drawing is completed. User 
 		   drawing should be done here. GOL will not change color, line 
 		   type and clipping region settings while  this function 
 		   returns zero.

 Output: If the function returns non-zero the draw control will be passed 
		to GOL. GOLDraw() can proceed and re-draw objects that needs 
		to be redrawn.
************************************************************************/
WORD GOLDrawCallback(void)
{
	///////////////////////////////////
	///////////////////////////////////
	return(1);
}

////////////////////////////////////
//INSERT OTHER FUNCTIONS USED HERE//
////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//                      BOARD INITIALIZTION FUNCTIONS
/////////////////////////////////////////////////////////////////////////////
/*********************************************************************
* Function: InitializeBoard()
* Overview: Initializes the hardware components including the PIC device
*           used.
*********************************************************************/
void InitializeBoard(void)
{
	const DRV_SPI_INIT_DATA SPI_Init_Data = {SST25_SPI_CHANNEL, 1, 0, 0, 1, 1, 0};

	Init_CPUClocks();

	INTEnableSystemMultiVectoredInt();
	SYSTEMConfigPerformance(GetSystemClock());

    GOLInit(); // Initialize graphics library and create default style scheme for GOL

	//The following are PIC device specific settings for the SPI channel used. 
	//Set IOs directions for SST25 SPI
	SST25_CS_LAT = 1;
	SST25_CS_TRIS = 0;

	// initialize the Flash Memory driver
	SST25Init((DRV_SPI_INIT_DATA*)&SPI_Init_Data); 
    
    // initialize the timer that manages the tick counter
    TickInit();                     	

    // initialize the components for Resistive Touch Screen
    TouchInit(NVMWrite, NVMRead, NVMSectorErase, NULL);
}    

/*********************************************************************
* Function: Init_CPUClocks()
* Overview: Initialize the CPU settings, clocks and registers for interrupts.
********************************************************************/
void Init_CPUClocks(void)
{
    int value;

    // this also enables the cache
    value = SYSTEMConfigPerformance(GetSystemClock());
    mOSCSetPBDIV(OSC_PB_DIV_2);

    INTEnableSystemMultiVectoredInt();

    value = OSCCON;
    while(!(value & 0x00000020))
        value = OSCCON; // Wait for PLL lock to stabilize

    AD1PCFG = 0xFFFF;       // Set analog pins to digital.
    TRISF = 0x00;
}

/*********************************************************************
* Function: Timer3 ISR
* Overview: increments tick counter. Tick is approx. 1 ms.
********************************************************************/
#define __T3_ISR    __ISR(_TIMER_3_VECTOR, ipl7)
#define TICK_PRESCALER	16
int tickscaler;

void __T3_ISR _T3Interrupt(void)
{
    TMR3 = 0;
	if (tickscaler > TICK_PRESCALER) {
    	tickscaler = 0;
    	tick++;
 	} 
 	else
    	tickscaler++;
 	  	
    TouchDetectPosition();
    mT3ClearIntFlag(); // Clear flag
}

/*********************************************************************
* Function: void TickInit(void)
* Overview: sets tick timer
********************************************************************/
#define TICK_PERIOD 		(GetSystemClock()/300000) 
void TickInit(void)
{
    // Initialize Timer4
    OpenTimer3(T3_ON | T3_PS_1_8, TICK_PERIOD);  // enable timer to run for approximately 100 us
    ConfigIntTimer3(T3_INT_ON | T3_INT_PRIOR_7); // Enable interrupt
    
    tickscaler = 0;
}

/*********************************************************************
* Function: WORD ExternalMemoryCallback(EXTDATA* memory, LONG offset, WORD nCount, void* buffer)
*
* Input:  memory - pointer to the bitmap or font external memory structures
*                  (FONT_EXTERNAL or BITMAP_EXTERNAL)
*         offset - data offset
*         nCount - number of bytes to be transferred to the buffer
*         buffer - pointer to the buffer
*
* Output: number of bytes were transferred.
*
* Overview: this function must be implemented in application. Graphics Library calls it
*           each time the data from external memory is required. The application must copy 
*           required data to the buffer provided.
********************************************************************/

// If there are several memories in the system they can be selected by IDs.
// In this program, ID for memory chip installed on Graphics PICTail board is assumed to be 0.
#define SST39_MEMORY    0
WORD ExternalMemoryCallback(IMAGE_EXTERNAL *memory, LONG offset, WORD nCount, void *buffer)
{
    if(memory->ID == SST39_MEMORY)
    {
		SST25ReadArray(memory->address + offset, // address to read from
		(BYTE *)buffer, nCount);
    }
    return (nCount);
}
