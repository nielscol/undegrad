#include <xc.h>

#define SUPRESS_PLIB_WARNING 1
#define _DISABLE_OPENADC10_CONFIGPORT_WARNING
// Configuration bit setting
// counter delay
#define DELAY 320000
// CAN definitions
#define MY_SID 0x123 // 11­bit CAN frame ID
#define FIFO_0_SIZE 4 // size of FIFO 0 (RX), in number of message buffers
#define FIFO_1_SIZE 2 // size of FIFO 1 (TX), in number of message buffers
#define MB_SIZE 4       // number of 4­byte integers in a message buffer
// buffer for CAN FIFOs
#include <p32xxxx.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/kmem.h>

static volatile unsigned int fifos[(FIFO_0_SIZE + FIFO_1_SIZE) * MB_SIZE]; 
    int to_send = 0;    // led blink value
    int count;         // blink counter
    unsigned int * addr; // used for storing fifo addresses

int main() {
//*********************** initialization ***********************************  
   // Initialize Port A and C
    TRISDbits.TRISD0=0; 
    TRISDbits.TRISD1=0;
    TRISDbits.TRISD2=0;
    TRISDbits.TRISD6 = 1;
    TRISDbits.TRISD7 = 1;
    TRISDbits.TRISD13 = 1;    
    CNPUEbits.CNPUE6 = 1;
    CNPUEbits.CNPUE7 = 1;
    CNPUEbits.CNPUE13 = 1;
    PORTDbits.RD0 = 0; 
    PORTDbits.RD1 = 0; 
    PORTDbits.RD2 = 0; 
  
   // Initialize CAN module
   C1CONbits.ON = 1;                    // turn on the CAN module 
   C1CONbits.REQOP = 4;                 // request configure mode
      while(C1CONbits.OPMOD != 4);      // wait to enter config mode
   C1FIFOCON0bits.FSIZE = FIFO_0_SIZE-1;// set fifo 0 size. Actual size is 1+FSIZE
   C1FIFOCON0bits.TXEN = 0;             // fifo 0 is an RX fifo
   C1FIFOCON1bits.FSIZE = FIFO_1_SIZE-1;// set fifo 1 size. Actual size is 1+FSIZE
   C1FIFOCON1bits.TXEN = 1;             // fifo 1 is a TX fifo
   C1FIFOBA = KVA_TO_PA(fifos);         // tell CAN where the fifos are

   C1RXM0bits.SID = 0x7FF;              // mask 0 requires all SID bits to match
   C1FLTCON0bits.FSEL0 = 0;             // filter 0 is for FIFO 0
   C1FLTCON0bits.MSEL0 = 0;             // filter 0 uses mask 0
   C1RXF0bits.SID = MY_SID;             // filter 0 matches against SID
   C1FLTCON0bits.FLTEN0 = 1;            // enable filter 0
        
//­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­ skipping baud settings since loopback only
   C1CONbits.REQOP = 2;                 // request loopback mode 
      while(C1CONbits.OPMOD != 2);      // wait for loopback mode 
//*********************** main loop *********************************** 
// main loop
  while(1) {
    
// ­­­­­­­­­­­­­­­­­­­­­­ transmit ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­

      if(!PORTDbits.RD6) //encode the three switch values to first 3 bits of to_send
         to_send ^= 1;   //toggle bit if switch pressed
      else if(!PORTDbits.RD7)
          to_send ^= 2;
      else if(!PORTDbits.RD13)
          to_send ^= 4;
      
      addr = PA_TO_KVA1(C1FIFOUA1);      // get FIFO 1 (the TX fifo) current message address
      addr[0] = MY_SID;                  // only the sid must be set for this example
      addr[1] = sizeof(to_send);         // only DLC field must be set, we indicate 4 bytes
      addr[2] = to_send;                 // 4 bytes of actual data
      C1FIFOCON1SET = 0x2000;            // setting UINC bit tells fifo to increment pointer
      C1FIFOCON1bits.TXREQ = 1;          // request that data from the queue be sent
// ­­­­­­­­­­­­­­­­­­­­­­ receive ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
     while(!C1FIFOINT0bits.RXNEMPTYIF); // wait to receive data
     addr = PA_TO_KVA1(C1FIFOUA0);      // get the VA of current pointer to the RX FIFO

     PORTDbits.RD0 = (addr[2] & 1);
     PORTDbits.RD1 = ((addr[2] & 2)>>1);
     PORTDbits.RD2 = ((addr[2] & 4)>>2);
          
     C1FIFOCON0SET = 0x2000;            // setting UINC bit tells fifo to increment
     
     int j;
     for(j = 0; j<20000; j++); //delay to improve debouncing (switches sensitive)

     while(!PORTDbits.RD6); //wait for button release
     while(!PORTDbits.RD7);
     while(!PORTDbits.RD13);

     int j;
     for(j = 0; j<20000; j++); //delay to improve debouncing (switches sensitive)
  }
  return 0;
}
