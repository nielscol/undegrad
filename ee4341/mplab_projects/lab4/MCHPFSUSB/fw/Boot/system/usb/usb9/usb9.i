#line 1 "usb9.c"
#line 1 "usb9.c"

#line 35 "usb9.c"
 


#line 44 "usb9.c"
 

 
#line 1 "C:/MCC18/h/p18cxxx.h"

#line 3 "C:/MCC18/h/p18cxxx.h"

#line 5 "C:/MCC18/h/p18cxxx.h"
#line 7 "C:/MCC18/h/p18cxxx.h"
#line 9 "C:/MCC18/h/p18cxxx.h"
#line 11 "C:/MCC18/h/p18cxxx.h"
#line 13 "C:/MCC18/h/p18cxxx.h"
#line 15 "C:/MCC18/h/p18cxxx.h"
#line 17 "C:/MCC18/h/p18cxxx.h"
#line 19 "C:/MCC18/h/p18cxxx.h"
#line 21 "C:/MCC18/h/p18cxxx.h"
#line 23 "C:/MCC18/h/p18cxxx.h"
#line 25 "C:/MCC18/h/p18cxxx.h"
#line 27 "C:/MCC18/h/p18cxxx.h"
#line 29 "C:/MCC18/h/p18cxxx.h"
#line 31 "C:/MCC18/h/p18cxxx.h"
#line 33 "C:/MCC18/h/p18cxxx.h"
#line 35 "C:/MCC18/h/p18cxxx.h"
#line 37 "C:/MCC18/h/p18cxxx.h"
#line 39 "C:/MCC18/h/p18cxxx.h"
#line 41 "C:/MCC18/h/p18cxxx.h"
#line 43 "C:/MCC18/h/p18cxxx.h"
#line 45 "C:/MCC18/h/p18cxxx.h"
#line 47 "C:/MCC18/h/p18cxxx.h"
#line 49 "C:/MCC18/h/p18cxxx.h"
#line 51 "C:/MCC18/h/p18cxxx.h"
#line 1 "C:/MCC18/h/p18f2450.h"

#line 5 "C:/MCC18/h/p18f2450.h"
 


#line 9 "C:/MCC18/h/p18f2450.h"

extern volatile near unsigned            UFRM;
extern volatile near unsigned char       UFRML;
extern volatile near struct {
  unsigned FRM0:1;
  unsigned FRM1:1;
  unsigned FRM2:1;
  unsigned FRM3:1;
  unsigned FRM4:1;
  unsigned FRM5:1;
  unsigned FRM6:1;
  unsigned FRM7:1;
} UFRMLbits;
extern volatile near unsigned char       UFRMH;
extern volatile near struct {
  unsigned FRM8:1;
  unsigned FRM9:1;
  unsigned FRM10:1;
} UFRMHbits;
extern volatile near unsigned char       UIR;
extern volatile near struct {
  unsigned URSTIF:1;
  unsigned UERRIF:1;
  unsigned ACTVIF:1;
  unsigned TRNIF:1;
  unsigned IDLEIF:1;
  unsigned STALLIF:1;
  unsigned SOFIF:1;
} UIRbits;
extern volatile near unsigned char       UIE;
extern volatile near struct {
  unsigned URSTIE:1;
  unsigned UERRIE:1;
  unsigned ACTVIE:1;
  unsigned TRNIE:1;
  unsigned IDLEIE:1;
  unsigned STALLIE:1;
  unsigned SOFIE:1;
} UIEbits;
extern volatile near unsigned char       UEIR;
extern volatile near struct {
  unsigned PIDEF:1;
  unsigned CRC5EF:1;
  unsigned CRC16EF:1;
  unsigned DFN8EF:1;
  unsigned BTOEF:1;
  unsigned :2;
  unsigned BTSEF:1;
} UEIRbits;
extern volatile near unsigned char       UEIE;
extern volatile near struct {
  unsigned PIDEE:1;
  unsigned CRC5EE:1;
  unsigned CRC16EE:1;
  unsigned DFN8EE:1;
  unsigned BTOEE:1;
  unsigned :2;
  unsigned BTSEE:1;
} UEIEbits;
extern volatile near unsigned char       USTAT;
extern volatile near struct {
  unsigned :1;
  unsigned PPBI:1;
  unsigned DIR:1;
  unsigned ENDP0:1;
  unsigned ENDP1:1;
  unsigned ENDP2:1;
  unsigned ENDP3:1;
} USTATbits;
extern volatile near unsigned char       UCON;
extern volatile near struct {
  unsigned :1;
  unsigned SUSPND:1;
  unsigned RESUME:1;
  unsigned USBEN:1;
  unsigned PKTDIS:1;
  unsigned SE0:1;
  unsigned PPBRST:1;
} UCONbits;
extern volatile near unsigned char       UADDR;
extern volatile near struct {
  unsigned ADDR0:1;
  unsigned ADDR1:1;
  unsigned ADDR2:1;
  unsigned ADDR3:1;
  unsigned ADDR4:1;
  unsigned ADDR5:1;
  unsigned ADDR6:1;
} UADDRbits;
extern volatile near unsigned char       UCFG;
extern volatile near struct {
  unsigned PPB0:1;
  unsigned PPB1:1;
  unsigned FSEN:1;
  unsigned UTRDIS:1;
  unsigned UPUEN:1;
  unsigned :1;
  unsigned UOEMON:1;
  unsigned UTEYE:1;
} UCFGbits;
extern volatile near unsigned char       UEP0;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP0bits;
extern volatile near unsigned char       UEP1;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP1bits;
extern volatile near unsigned char       UEP2;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP2bits;
extern volatile near unsigned char       UEP3;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP3bits;
extern volatile near unsigned char       UEP4;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP4bits;
extern volatile near unsigned char       UEP5;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP5bits;
extern volatile near unsigned char       UEP6;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP6bits;
extern volatile near unsigned char       UEP7;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP7bits;
extern volatile near unsigned char       UEP8;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP8bits;
extern volatile near unsigned char       UEP9;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP9bits;
extern volatile near unsigned char       UEP10;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP10bits;
extern volatile near unsigned char       UEP11;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP11bits;
extern volatile near unsigned char       UEP12;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP12bits;
extern volatile near unsigned char       UEP13;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP13bits;
extern volatile near unsigned char       UEP14;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP14bits;
extern volatile near unsigned char       UEP15;
extern volatile near struct {
  unsigned EPSTALL:1;
  unsigned EPINEN:1;
  unsigned EPOUTEN:1;
  unsigned EPCONDIS:1;
  unsigned EPHSHK:1;
} UEP15bits;
extern volatile near unsigned char       PORTA;
extern volatile near union {
  struct {
    unsigned RA0:1;
    unsigned RA1:1;
    unsigned RA2:1;
    unsigned RA3:1;
    unsigned RA4:1;
    unsigned RA5:1;
    unsigned RA6:1;
  };
  struct {
    unsigned AN0:1;
    unsigned AN1:1;
    unsigned AN2:1;
    unsigned AN3:1;
    unsigned T0CKI:1;
    unsigned AN4:1;
    unsigned OSC2:1;
  };
  struct {
    unsigned :2;
    unsigned VREFM:1;
    unsigned VREFP:1;
    unsigned RCV:1;
    unsigned LVDIN:1;
  };
  struct {
    unsigned :5;
    unsigned HLVDIN:1;
  };
} PORTAbits;
extern volatile near unsigned char       PORTB;
extern volatile near union {
  struct {
    unsigned RB0:1;
    unsigned RB1:1;
    unsigned RB2:1;
    unsigned RB3:1;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
  };
  struct {
    unsigned INT0:1;
    unsigned INT1:1;
    unsigned INT2:1;
  };
  struct {
    unsigned AN12:1;
    unsigned AN10:1;
    unsigned AN8:1;
    unsigned AN9:1;
    unsigned AN11:1;
    unsigned PGM:1;
    unsigned PGC:1;
    unsigned PGD:1;
  };
  struct {
    unsigned :2;
    unsigned VMO:1;
    unsigned VPO:1;
    unsigned KBI0:1;
    unsigned KBI1:1;
    unsigned KBI2:1;
    unsigned KBI3:1;
  };
} PORTBbits;
extern volatile near unsigned char       PORTC;
extern volatile near union {
  struct {
    unsigned RC0:1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned :1;
    unsigned RC4:1;
    unsigned RC5:1;
    unsigned RC6:1;
    unsigned RC7:1;
  };
  struct {
    unsigned T1OSO:1;
    unsigned T1OSI:1;
    unsigned CCP1:1;
    unsigned :3;
    unsigned TX:1;
    unsigned RX:1;
  };
  struct {
    unsigned T1CKI:1;
    unsigned NOT_UOE:1;
    unsigned P1A:1;
    unsigned :3;
    unsigned CK:1;
    unsigned DT:1;
  };
  struct {
    unsigned :1;
    unsigned UOE:1;
  };
} PORTCbits;
extern volatile near unsigned char       PORTE;
extern volatile near struct {
  unsigned :3;
  unsigned RE3:1;
} PORTEbits;
extern volatile near unsigned char       LATA;
extern volatile near struct {
  unsigned LATA0:1;
  unsigned LATA1:1;
  unsigned LATA2:1;
  unsigned LATA3:1;
  unsigned LATA4:1;
  unsigned LATA5:1;
  unsigned LATA6:1;
} LATAbits;
extern volatile near unsigned char       LATB;
extern volatile near struct {
  unsigned LATB0:1;
  unsigned LATB1:1;
  unsigned LATB2:1;
  unsigned LATB3:1;
  unsigned LATB4:1;
  unsigned LATB5:1;
  unsigned LATB6:1;
  unsigned LATB7:1;
} LATBbits;
extern volatile near unsigned char       LATC;
extern volatile near struct {
  unsigned LATC0:1;
  unsigned LATC1:1;
  unsigned LATC2:1;
  unsigned :3;
  unsigned LATC6:1;
  unsigned LATC7:1;
} LATCbits;
extern volatile near unsigned char       DDRA;
extern volatile near struct {
  unsigned RA0:1;
  unsigned RA1:1;
  unsigned RA2:1;
  unsigned RA3:1;
  unsigned RA4:1;
  unsigned RA5:1;
  unsigned RA6:1;
} DDRAbits;
extern volatile near unsigned char       TRISA;
extern volatile near struct {
  unsigned TRISA0:1;
  unsigned TRISA1:1;
  unsigned TRISA2:1;
  unsigned TRISA3:1;
  unsigned TRISA4:1;
  unsigned TRISA5:1;
  unsigned TRISA6:1;
} TRISAbits;
extern volatile near unsigned char       DDRB;
extern volatile near struct {
  unsigned RB0:1;
  unsigned RB1:1;
  unsigned RB2:1;
  unsigned RB3:1;
  unsigned RB4:1;
  unsigned RB5:1;
  unsigned RB6:1;
  unsigned RB7:1;
} DDRBbits;
extern volatile near unsigned char       TRISB;
extern volatile near struct {
  unsigned TRISB0:1;
  unsigned TRISB1:1;
  unsigned TRISB2:1;
  unsigned TRISB3:1;
  unsigned TRISB4:1;
  unsigned TRISB5:1;
  unsigned TRISB6:1;
  unsigned TRISB7:1;
} TRISBbits;
extern volatile near unsigned char       DDRC;
extern volatile near struct {
  unsigned RC0:1;
  unsigned RC1:1;
  unsigned RC2:1;
  unsigned :3;
  unsigned RC6:1;
  unsigned RC7:1;
} DDRCbits;
extern volatile near unsigned char       TRISC;
extern volatile near struct {
  unsigned TRISC0:1;
  unsigned TRISC1:1;
  unsigned TRISC2:1;
  unsigned :3;
  unsigned TRISC6:1;
  unsigned TRISC7:1;
} TRISCbits;
extern volatile near unsigned char       PIE1;
extern volatile near struct {
  unsigned TMR1IE:1;
  unsigned TMR2IE:1;
  unsigned CCP1IE:1;
  unsigned :1;
  unsigned TXIE:1;
  unsigned RCIE:1;
  unsigned ADIE:1;
} PIE1bits;
extern volatile near unsigned char       PIR1;
extern volatile near struct {
  unsigned TMR1IF:1;
  unsigned TMR2IF:1;
  unsigned CCP1IF:1;
  unsigned :1;
  unsigned TXIF:1;
  unsigned RCIF:1;
  unsigned ADIF:1;
} PIR1bits;
extern volatile near unsigned char       IPR1;
extern volatile near struct {
  unsigned TMR1IP:1;
  unsigned TMR2IP:1;
  unsigned CCP1IP:1;
  unsigned :1;
  unsigned TXIP:1;
  unsigned RCIP:1;
  unsigned ADIP:1;
} IPR1bits;
extern volatile near unsigned char       PIE2;
extern volatile near union {
  struct {
    unsigned :2;
    unsigned LVDIE:1;
    unsigned :2;
    unsigned USBIE:1;
    unsigned :1;
    unsigned OSCFIE:1;
  };
  struct {
    unsigned :2;
    unsigned HLVDIE:1;
  };
} PIE2bits;
extern volatile near unsigned char       PIR2;
extern volatile near union {
  struct {
    unsigned :2;
    unsigned LVDIF:1;
    unsigned :2;
    unsigned USBIF:1;
    unsigned :1;
    unsigned OSCFIF:1;
  };
  struct {
    unsigned :2;
    unsigned HLVDIF:1;
  };
} PIR2bits;
extern volatile near unsigned char       IPR2;
extern volatile near union {
  struct {
    unsigned :2;
    unsigned LVDIP:1;
    unsigned :2;
    unsigned USBIP:1;
    unsigned :1;
    unsigned OSCFIP:1;
  };
  struct {
    unsigned :2;
    unsigned HLVDIP:1;
  };
} IPR2bits;
extern volatile near unsigned char       EECON1;
extern volatile near struct {
  unsigned :1;
  unsigned WR:1;
  unsigned WREN:1;
  unsigned WRERR:1;
  unsigned FREE:1;
  unsigned :1;
  unsigned CFGS:1;
} EECON1bits;
extern volatile near unsigned char       EECON2;
extern volatile near unsigned char       RCSTA;
extern volatile near union {
  struct {
    unsigned RX9D:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned ADDEN:1;
    unsigned CREN:1;
    unsigned SREN:1;
    unsigned RX9:1;
    unsigned SPEN:1;
  };
  struct {
    unsigned :3;
    unsigned ADEN:1;
  };
} RCSTAbits;
extern volatile near unsigned char       TXSTA;
extern volatile near struct {
  unsigned TX9D:1;
  unsigned TRMT:1;
  unsigned BRGH:1;
  unsigned SENDB:1;
  unsigned SYNC:1;
  unsigned TXEN:1;
  unsigned TX9:1;
  unsigned CSRC:1;
} TXSTAbits;
extern volatile near unsigned char       TXREG;
extern volatile near unsigned char       RCREG;
extern volatile near unsigned char       SPBRG;
extern volatile near unsigned char       SPBRGH;
extern volatile near unsigned char       BAUDCON;
extern volatile near union {
  struct {
    unsigned ABDEN:1;
    unsigned WUE:1;
    unsigned :1;
    unsigned BRG16:1;
    unsigned SCKP:1;
    unsigned :1;
    unsigned RCIDL:1;
    unsigned ABDOVF:1;
  };
  struct {
    unsigned :6;
    unsigned RCMT:1;
  };
} BAUDCONbits;
extern volatile near unsigned char       CCP1CON;
extern volatile near struct {
  unsigned CCP1M0:1;
  unsigned CCP1M1:1;
  unsigned CCP1M2:1;
  unsigned CCP1M3:1;
  unsigned DC1B0:1;
  unsigned DC1B1:1;
} CCP1CONbits;
extern volatile near unsigned            CCPR1;
extern volatile near unsigned char       CCPR1L;
extern volatile near unsigned char       CCPR1H;
extern volatile near unsigned char       ADCON2;
extern volatile near struct {
  unsigned ADCS0:1;
  unsigned ADCS1:1;
  unsigned ADCS2:1;
  unsigned ACQT0:1;
  unsigned ACQT1:1;
  unsigned ACQT2:1;
  unsigned :1;
  unsigned ADFM:1;
} ADCON2bits;
extern volatile near unsigned char       ADCON1;
extern volatile near struct {
  unsigned PCFG0:1;
  unsigned PCFG1:1;
  unsigned PCFG2:1;
  unsigned PCFG3:1;
  unsigned VCFG0:1;
  unsigned VCFG1:1;
} ADCON1bits;
extern volatile near unsigned char       ADCON0;
extern volatile near union {
  struct {
    unsigned ADON:1;
    unsigned GO_DONE:1;
    unsigned CHS0:1;
    unsigned CHS1:1;
    unsigned CHS2:1;
    unsigned CHS3:1;
  };
  struct {
    unsigned :1;
    unsigned DONE:1;
  };
  struct {
    unsigned :1;
    unsigned GO:1;
  };
  struct {
    unsigned :1;
    unsigned NOT_DONE:1;
  };
} ADCON0bits;
extern volatile near unsigned            ADRES;
extern volatile near unsigned char       ADRESL;
extern volatile near unsigned char       ADRESH;
extern volatile near unsigned char       T2CON;
extern volatile near struct {
  unsigned T2CKPS0:1;
  unsigned T2CKPS1:1;
  unsigned TMR2ON:1;
  unsigned T2OUTPS0:1;
  unsigned T2OUTPS1:1;
  unsigned T2OUTPS2:1;
  unsigned T2OUTPS3:1;
} T2CONbits;
extern volatile near unsigned char       PR2;
extern volatile near unsigned char       TMR2;
extern volatile near unsigned char       T1CON;
extern volatile near union {
  struct {
    unsigned TMR1ON:1;
    unsigned TMR1CS:1;
    unsigned T1SYNC:1;
    unsigned T1OSCEN:1;
    unsigned T1CKPS0:1;
    unsigned T1CKPS1:1;
    unsigned T1RUN:1;
    unsigned RD16:1;
  };
  struct {
    unsigned :2;
    unsigned NOT_T1SYNC:1;
  };
} T1CONbits;
extern volatile near unsigned char       TMR1L;
extern volatile near unsigned char       TMR1H;
extern volatile near unsigned char       RCON;
extern volatile near union {
  struct {
    unsigned NOT_BOR:1;
    unsigned NOT_POR:1;
    unsigned NOT_PD:1;
    unsigned NOT_TO:1;
    unsigned NOT_RI:1;
    unsigned :1;
    unsigned SBOREN:1;
    unsigned NOT_IPEN:1;
  };
  struct {
    unsigned BOR:1;
    unsigned POR:1;
    unsigned PD:1;
    unsigned TO:1;
    unsigned RI:1;
    unsigned :2;
    unsigned IPEN:1;
  };
} RCONbits;
extern volatile near unsigned char       WDTCON;
extern volatile near union {
  struct {
    unsigned SWDTEN:1;
  };
  struct {
    unsigned SWDTE:1;
  };
} WDTCONbits;
extern volatile near unsigned char       HLVDCON;
extern volatile near union {
  struct {
    unsigned LVDL0:1;
    unsigned LVDL1:1;
    unsigned LVDL2:1;
    unsigned LVDL3:1;
    unsigned LVDEN:1;
    unsigned IRVST:1;
  };
  struct {
    unsigned LVV0:1;
    unsigned LVV1:1;
    unsigned LVV2:1;
    unsigned LVV3:1;
    unsigned :1;
    unsigned BGST:1;
  };
  struct {
    unsigned HLVDL0:1;
    unsigned HLVDL1:1;
    unsigned HLVDL2:1;
    unsigned HLVDL3:1;
    unsigned HLVDEN:1;
    unsigned :2;
    unsigned VDIRMAG:1;
  };
  struct {
    unsigned :5;
    unsigned IVRST:1;
  };
} HLVDCONbits;
extern volatile near unsigned char       LVDCON;
extern volatile near union {
  struct {
    unsigned LVDL0:1;
    unsigned LVDL1:1;
    unsigned LVDL2:1;
    unsigned LVDL3:1;
    unsigned LVDEN:1;
    unsigned IRVST:1;
  };
  struct {
    unsigned LVV0:1;
    unsigned LVV1:1;
    unsigned LVV2:1;
    unsigned LVV3:1;
    unsigned :1;
    unsigned BGST:1;
  };
  struct {
    unsigned HLVDL0:1;
    unsigned HLVDL1:1;
    unsigned HLVDL2:1;
    unsigned HLVDL3:1;
    unsigned HLVDEN:1;
    unsigned :2;
    unsigned VDIRMAG:1;
  };
  struct {
    unsigned :5;
    unsigned IVRST:1;
  };
} LVDCONbits;
extern volatile near unsigned char       OSCCON;
extern volatile near struct {
  unsigned SCS0:1;
  unsigned SCS1:1;
  unsigned :1;
  unsigned OSTS:1;
  unsigned :3;
  unsigned IDLEN:1;
} OSCCONbits;
extern volatile near unsigned char       T0CON;
extern volatile near struct {
  unsigned T0PS0:1;
  unsigned T0PS1:1;
  unsigned T0PS2:1;
  unsigned PSA:1;
  unsigned T0SE:1;
  unsigned T0CS:1;
  unsigned T08BIT:1;
  unsigned TMR0ON:1;
} T0CONbits;
extern volatile near unsigned char       TMR0L;
extern volatile near unsigned char       TMR0H;
extern          near unsigned char       STATUS;
extern          near struct {
  unsigned C:1;
  unsigned DC:1;
  unsigned Z:1;
  unsigned OV:1;
  unsigned N:1;
} STATUSbits;
extern          near unsigned            FSR2;
extern          near unsigned char       FSR2L;
extern          near unsigned char       FSR2H;
extern volatile near unsigned char       PLUSW2;
extern volatile near unsigned char       PREINC2;
extern volatile near unsigned char       POSTDEC2;
extern volatile near unsigned char       POSTINC2;
extern          near unsigned char       INDF2;
extern          near unsigned char       BSR;
extern          near unsigned            FSR1;
extern          near unsigned char       FSR1L;
extern          near unsigned char       FSR1H;
extern volatile near unsigned char       PLUSW1;
extern volatile near unsigned char       PREINC1;
extern volatile near unsigned char       POSTDEC1;
extern volatile near unsigned char       POSTINC1;
extern          near unsigned char       INDF1;
extern          near unsigned char       WREG;
extern          near unsigned            FSR0;
extern          near unsigned char       FSR0L;
extern          near unsigned char       FSR0H;
extern volatile near unsigned char       PLUSW0;
extern volatile near unsigned char       PREINC0;
extern volatile near unsigned char       POSTDEC0;
extern volatile near unsigned char       POSTINC0;
extern          near unsigned char       INDF0;
extern volatile near unsigned char       INTCON3;
extern volatile near union {
  struct {
    unsigned INT1IF:1;
    unsigned INT2IF:1;
    unsigned :1;
    unsigned INT1IE:1;
    unsigned INT2IE:1;
    unsigned :1;
    unsigned INT1IP:1;
    unsigned INT2IP:1;
  };
  struct {
    unsigned INT1F:1;
    unsigned INT2F:1;
    unsigned :1;
    unsigned INT1E:1;
    unsigned INT2E:1;
    unsigned :1;
    unsigned INT1P:1;
    unsigned INT2P:1;
  };
} INTCON3bits;
extern volatile near unsigned char       INTCON2;
extern volatile near union {
  struct {
    unsigned RBIP:1;
    unsigned :1;
    unsigned TMR0IP:1;
    unsigned :1;
    unsigned INTEDG2:1;
    unsigned INTEDG1:1;
    unsigned INTEDG0:1;
    unsigned NOT_RBPU:1;
  };
  struct {
    unsigned :2;
    unsigned T0IP:1;
    unsigned :4;
    unsigned RBPU:1;
  };
} INTCON2bits;
extern volatile near unsigned char       INTCON;
extern volatile near union {
  struct {
    unsigned RBIF:1;
    unsigned INT0IF:1;
    unsigned TMR0IF:1;
    unsigned RBIE:1;
    unsigned INT0IE:1;
    unsigned TMR0IE:1;
    unsigned PEIE:1;
    unsigned GIE:1;
  };
  struct {
    unsigned :1;
    unsigned INT0F:1;
    unsigned T0IF:1;
    unsigned :1;
    unsigned INT0E:1;
    unsigned T0IE:1;
    unsigned GIEL:1;
    unsigned GIEH:1;
  };
} INTCONbits;
extern          near unsigned            PROD;
extern          near unsigned char       PRODL;
extern          near unsigned char       PRODH;
extern volatile near unsigned char       TABLAT;
extern volatile near unsigned short long TBLPTR;
extern volatile near unsigned char       TBLPTRL;
extern volatile near unsigned char       TBLPTRH;
extern volatile near unsigned char       TBLPTRU;
extern volatile near unsigned short long PC;
extern volatile near unsigned char       PCL;
extern volatile near unsigned char       PCLATH;
extern volatile near unsigned char       PCLATU;
extern volatile near unsigned char       STKPTR;
extern volatile near union {
  struct {
    unsigned STKPTR0:1;
    unsigned STKPTR1:1;
    unsigned STKPTR2:1;
    unsigned STKPTR3:1;
    unsigned STKPTR4:1;
    unsigned :1;
    unsigned STKUNF:1;
    unsigned STKFUL:1;
  };
  struct {
    unsigned :7;
    unsigned STKOVF:1;
  };
} STKPTRbits;
extern          near unsigned short long TOS;
extern          near unsigned char       TOSL;
extern          near unsigned char       TOSH;
extern          near unsigned char       TOSU;



#line 911 "C:/MCC18/h/p18f2450.h"
 
#line 913 "C:/MCC18/h/p18f2450.h"
#line 914 "C:/MCC18/h/p18f2450.h"


#line 917 "C:/MCC18/h/p18f2450.h"
 
#line 919 "C:/MCC18/h/p18f2450.h"
#line 920 "C:/MCC18/h/p18f2450.h"
#line 921 "C:/MCC18/h/p18f2450.h"
#line 922 "C:/MCC18/h/p18f2450.h"

#line 924 "C:/MCC18/h/p18f2450.h"
#line 925 "C:/MCC18/h/p18f2450.h"
#line 926 "C:/MCC18/h/p18f2450.h"
#line 927 "C:/MCC18/h/p18f2450.h"
#line 928 "C:/MCC18/h/p18f2450.h"


#line 932 "C:/MCC18/h/p18f2450.h"
 
#line 934 "C:/MCC18/h/p18f2450.h"


#line 937 "C:/MCC18/h/p18f2450.h"
#line 51 "C:/MCC18/h/p18cxxx.h"

#line 53 "C:/MCC18/h/p18cxxx.h"
#line 55 "C:/MCC18/h/p18cxxx.h"
#line 57 "C:/MCC18/h/p18cxxx.h"
#line 59 "C:/MCC18/h/p18cxxx.h"
#line 61 "C:/MCC18/h/p18cxxx.h"
#line 63 "C:/MCC18/h/p18cxxx.h"
#line 65 "C:/MCC18/h/p18cxxx.h"
#line 67 "C:/MCC18/h/p18cxxx.h"
#line 69 "C:/MCC18/h/p18cxxx.h"
#line 71 "C:/MCC18/h/p18cxxx.h"
#line 73 "C:/MCC18/h/p18cxxx.h"
#line 75 "C:/MCC18/h/p18cxxx.h"
#line 77 "C:/MCC18/h/p18cxxx.h"
#line 79 "C:/MCC18/h/p18cxxx.h"
#line 81 "C:/MCC18/h/p18cxxx.h"
#line 83 "C:/MCC18/h/p18cxxx.h"
#line 85 "C:/MCC18/h/p18cxxx.h"
#line 87 "C:/MCC18/h/p18cxxx.h"
#line 89 "C:/MCC18/h/p18cxxx.h"
#line 91 "C:/MCC18/h/p18cxxx.h"
#line 93 "C:/MCC18/h/p18cxxx.h"
#line 95 "C:/MCC18/h/p18cxxx.h"
#line 97 "C:/MCC18/h/p18cxxx.h"
#line 99 "C:/MCC18/h/p18cxxx.h"
#line 101 "C:/MCC18/h/p18cxxx.h"
#line 103 "C:/MCC18/h/p18cxxx.h"
#line 105 "C:/MCC18/h/p18cxxx.h"
#line 107 "C:/MCC18/h/p18cxxx.h"
#line 109 "C:/MCC18/h/p18cxxx.h"
#line 111 "C:/MCC18/h/p18cxxx.h"
#line 113 "C:/MCC18/h/p18cxxx.h"
#line 115 "C:/MCC18/h/p18cxxx.h"
#line 117 "C:/MCC18/h/p18cxxx.h"
#line 119 "C:/MCC18/h/p18cxxx.h"
#line 121 "C:/MCC18/h/p18cxxx.h"
#line 123 "C:/MCC18/h/p18cxxx.h"
#line 125 "C:/MCC18/h/p18cxxx.h"
#line 127 "C:/MCC18/h/p18cxxx.h"
#line 129 "C:/MCC18/h/p18cxxx.h"
#line 131 "C:/MCC18/h/p18cxxx.h"
#line 133 "C:/MCC18/h/p18cxxx.h"
#line 135 "C:/MCC18/h/p18cxxx.h"
#line 137 "C:/MCC18/h/p18cxxx.h"
#line 139 "C:/MCC18/h/p18cxxx.h"
#line 141 "C:/MCC18/h/p18cxxx.h"
#line 143 "C:/MCC18/h/p18cxxx.h"
#line 145 "C:/MCC18/h/p18cxxx.h"
#line 147 "C:/MCC18/h/p18cxxx.h"
#line 149 "C:/MCC18/h/p18cxxx.h"
#line 151 "C:/MCC18/h/p18cxxx.h"
#line 153 "C:/MCC18/h/p18cxxx.h"
#line 155 "C:/MCC18/h/p18cxxx.h"
#line 157 "C:/MCC18/h/p18cxxx.h"
#line 159 "C:/MCC18/h/p18cxxx.h"
#line 161 "C:/MCC18/h/p18cxxx.h"
#line 163 "C:/MCC18/h/p18cxxx.h"
#line 165 "C:/MCC18/h/p18cxxx.h"
#line 167 "C:/MCC18/h/p18cxxx.h"
#line 169 "C:/MCC18/h/p18cxxx.h"
#line 171 "C:/MCC18/h/p18cxxx.h"
#line 173 "C:/MCC18/h/p18cxxx.h"
#line 175 "C:/MCC18/h/p18cxxx.h"
#line 177 "C:/MCC18/h/p18cxxx.h"
#line 179 "C:/MCC18/h/p18cxxx.h"
#line 181 "C:/MCC18/h/p18cxxx.h"
#line 183 "C:/MCC18/h/p18cxxx.h"
#line 185 "C:/MCC18/h/p18cxxx.h"
#line 187 "C:/MCC18/h/p18cxxx.h"
#line 189 "C:/MCC18/h/p18cxxx.h"
#line 191 "C:/MCC18/h/p18cxxx.h"
#line 193 "C:/MCC18/h/p18cxxx.h"
#line 195 "C:/MCC18/h/p18cxxx.h"
#line 197 "C:/MCC18/h/p18cxxx.h"
#line 199 "C:/MCC18/h/p18cxxx.h"
#line 201 "C:/MCC18/h/p18cxxx.h"
#line 203 "C:/MCC18/h/p18cxxx.h"
#line 205 "C:/MCC18/h/p18cxxx.h"
#line 207 "C:/MCC18/h/p18cxxx.h"
#line 209 "C:/MCC18/h/p18cxxx.h"
#line 211 "C:/MCC18/h/p18cxxx.h"
#line 213 "C:/MCC18/h/p18cxxx.h"
#line 215 "C:/MCC18/h/p18cxxx.h"
#line 217 "C:/MCC18/h/p18cxxx.h"
#line 219 "C:/MCC18/h/p18cxxx.h"
#line 221 "C:/MCC18/h/p18cxxx.h"
#line 223 "C:/MCC18/h/p18cxxx.h"
#line 225 "C:/MCC18/h/p18cxxx.h"
#line 227 "C:/MCC18/h/p18cxxx.h"
#line 229 "C:/MCC18/h/p18cxxx.h"
#line 231 "C:/MCC18/h/p18cxxx.h"
#line 233 "C:/MCC18/h/p18cxxx.h"
#line 235 "C:/MCC18/h/p18cxxx.h"
#line 237 "C:/MCC18/h/p18cxxx.h"
#line 239 "C:/MCC18/h/p18cxxx.h"
#line 241 "C:/MCC18/h/p18cxxx.h"
#line 243 "C:/MCC18/h/p18cxxx.h"
#line 245 "C:/MCC18/h/p18cxxx.h"
#line 247 "C:/MCC18/h/p18cxxx.h"
#line 249 "C:/MCC18/h/p18cxxx.h"
#line 251 "C:/MCC18/h/p18cxxx.h"
#line 253 "C:/MCC18/h/p18cxxx.h"
#line 255 "C:/MCC18/h/p18cxxx.h"
#line 257 "C:/MCC18/h/p18cxxx.h"
#line 259 "C:/MCC18/h/p18cxxx.h"
#line 261 "C:/MCC18/h/p18cxxx.h"
#line 263 "C:/MCC18/h/p18cxxx.h"
#line 265 "C:/MCC18/h/p18cxxx.h"
#line 267 "C:/MCC18/h/p18cxxx.h"
#line 269 "C:/MCC18/h/p18cxxx.h"
#line 271 "C:/MCC18/h/p18cxxx.h"
#line 273 "C:/MCC18/h/p18cxxx.h"
#line 275 "C:/MCC18/h/p18cxxx.h"
#line 277 "C:/MCC18/h/p18cxxx.h"
#line 279 "C:/MCC18/h/p18cxxx.h"
#line 281 "C:/MCC18/h/p18cxxx.h"
#line 283 "C:/MCC18/h/p18cxxx.h"
#line 285 "C:/MCC18/h/p18cxxx.h"
#line 287 "C:/MCC18/h/p18cxxx.h"
#line 289 "C:/MCC18/h/p18cxxx.h"
#line 291 "C:/MCC18/h/p18cxxx.h"
#line 293 "C:/MCC18/h/p18cxxx.h"
#line 295 "C:/MCC18/h/p18cxxx.h"
#line 297 "C:/MCC18/h/p18cxxx.h"
#line 299 "C:/MCC18/h/p18cxxx.h"
#line 301 "C:/MCC18/h/p18cxxx.h"
#line 303 "C:/MCC18/h/p18cxxx.h"
#line 305 "C:/MCC18/h/p18cxxx.h"
#line 307 "C:/MCC18/h/p18cxxx.h"
#line 309 "C:/MCC18/h/p18cxxx.h"
#line 311 "C:/MCC18/h/p18cxxx.h"
#line 313 "C:/MCC18/h/p18cxxx.h"
#line 315 "C:/MCC18/h/p18cxxx.h"
#line 317 "C:/MCC18/h/p18cxxx.h"
#line 319 "C:/MCC18/h/p18cxxx.h"
#line 321 "C:/MCC18/h/p18cxxx.h"
#line 323 "C:/MCC18/h/p18cxxx.h"
#line 325 "C:/MCC18/h/p18cxxx.h"
#line 327 "C:/MCC18/h/p18cxxx.h"
#line 329 "C:/MCC18/h/p18cxxx.h"
#line 331 "C:/MCC18/h/p18cxxx.h"
#line 333 "C:/MCC18/h/p18cxxx.h"
#line 335 "C:/MCC18/h/p18cxxx.h"
#line 337 "C:/MCC18/h/p18cxxx.h"
#line 339 "C:/MCC18/h/p18cxxx.h"
#line 341 "C:/MCC18/h/p18cxxx.h"

#line 343 "C:/MCC18/h/p18cxxx.h"
#line 47 "usb9.c"

#line 1 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"

#line 35 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
 


#line 39 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"

typedef unsigned char   byte;           
typedef unsigned int    word;           
typedef unsigned long   dword;          

typedef union _BYTE
{
    byte _byte;
    struct
    {
        unsigned b0:1;
        unsigned b1:1;
        unsigned b2:1;
        unsigned b3:1;
        unsigned b4:1;
        unsigned b5:1;
        unsigned b6:1;
        unsigned b7:1;
    };
} BYTE;

typedef union _WORD
{
    word _word;
    struct
    {
        byte byte0;
        byte byte1;
    };
    struct
    {
        BYTE Byte0;
        BYTE Byte1;
    };
    struct
    {
        BYTE LowB;
        BYTE HighB;
    };
    struct
    {
        byte v[2];
    };
} WORD;
#line 84 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 85 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"

typedef union _DWORD
{
    dword _dword;
    struct
    {
        byte byte0;
        byte byte1;
        byte byte2;
        byte byte3;
    };
    struct
    {
        word word0;
        word word1;
    };
    struct
    {
        BYTE Byte0;
        BYTE Byte1;
        BYTE Byte2;
        BYTE Byte3;
    };
    struct
    {
        WORD Word0;
        WORD Word1;
    };
    struct
    {
        byte v[4];
    };
} DWORD;
#line 119 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 120 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 121 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 122 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"

typedef void(*pFunc)(void);

typedef union _POINTER
{
    struct
    {
        byte bLow;
        byte bHigh;
        
    };
    word _word;                         
    
    

    byte* bRam;                         
                                        
    word* wRam;                         
                                        

    rom byte* bRom;                     
    rom word* wRom;
    
    
    
    
} POINTER;

typedef enum _BOOL { FALSE = 0, TRUE } BOOL;

#line 153 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 154 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"

#line 156 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 48 "usb9.c"

#line 1 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"

#line 35 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"
 

#line 38 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"


#line 45 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"
 

#line 1 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

#line 32 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
 


#line 36 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

 
#line 39 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 40 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

 
#line 43 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 44 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"


#line 48 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
 



 


#line 58 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
 
#line 60 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 61 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

 

#line 65 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
 

 
#line 69 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 70 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 71 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 72 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 73 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

#line 75 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

#line 77 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 47 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"

#line 1 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"

#line 35 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
 


#line 39 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
 

#line 42 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"

 
#line 1 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"

#line 35 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
 

#line 156 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 44 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"


 

 
#line 50 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 51 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 52 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 53 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 54 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"


#line 62 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
 
#line 64 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 65 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 66 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 67 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 68 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 69 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 70 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 71 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 72 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 73 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 74 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 75 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 76 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 77 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 78 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 79 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 80 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 81 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 82 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 83 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 84 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 85 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 86 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 87 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 88 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 89 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 90 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 91 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 92 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 93 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"

 
#line 96 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 97 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 98 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"

 
#line 101 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 102 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 103 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 104 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"

 
#line 107 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 108 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 109 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 110 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"

 
#line 113 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 114 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 115 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"


 


#line 121 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
 
typedef struct _USB_DEV_DSC
{
    byte bLength;       byte bDscType;      word bcdUSB;
    byte bDevCls;       byte bDevSubCls;    byte bDevProtocol;
    byte bMaxPktSize0;  word idVendor;      word idProduct;
    word bcdDevice;     byte iMFR;          byte iProduct;
    byte iSerialNum;    byte bNumCfg;
} USB_DEV_DSC;


#line 133 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
 
typedef struct _USB_CFG_DSC
{
    byte bLength;       byte bDscType;      word wTotalLength;
    byte bNumIntf;      byte bCfgValue;     byte iCfg;
    byte bmAttributes;  byte bMaxPower;
} USB_CFG_DSC;


#line 143 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
 
typedef struct _USB_INTF_DSC
{
    byte bLength;       byte bDscType;      byte bIntfNum;
    byte bAltSetting;   byte bNumEPs;       byte bIntfCls;
    byte bIntfSubCls;   byte bIntfProtocol; byte iIntf;
} USB_INTF_DSC;


#line 153 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
 
typedef struct _USB_EP_DSC
{
    byte bLength;       byte bDscType;      byte bEPAdr;
    byte bmAttributes;  word wMaxPktSize;   byte bInterval;
} USB_EP_DSC;

#line 161 "C:/MCHPFSUSB/fw/Boot/system\usb\usbdefs\usbdefs_std_dsc.h"
#line 48 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"

#line 1 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"

#line 32 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"
 


#line 37 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"
 


#line 41 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"

 
#line 1 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"

#line 35 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
 

#line 156 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 43 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"

#line 1 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

#line 32 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
 


#line 48 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

#line 58 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"

#line 65 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 77 "C:/MCHPFSUSB/fw/Boot/autofiles\usbcfg.h"
#line 44 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"

#line 1 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"

#line 35 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"
 

#line 45 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"
#line 61 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"
#line 45 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"


 


#line 54 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"
#line 55 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"

 
extern rom USB_DEV_DSC device_dsc;
extern rom struct { USB_CFG_DSC cd01; USB_INTF_DSC i00a00; USB_EP_DSC ep01o_i00a00; USB_EP_DSC ep01i_i00a00; } cfg01 ;
extern rom struct{byte bLength;byte bDscType;word string[1];}sd000;

#line 62 "C:/MCHPFSUSB/fw/Boot/autofiles\usbdsc.h"
#line 49 "C:/MCHPFSUSB/fw/Boot/system\usb\usb.h"


#line 1 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"

#line 36 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
 

#line 39 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"

 
#line 1 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"

#line 35 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
 

#line 156 "C:/MCHPFSUSB/fw/Boot/system\typedefs.h"
#line 41 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"


 
 

#line 47 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 49 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 50 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 51 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"

#line 53 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 55 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"

#line 57 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 59 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"

#line 61 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 62 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 63 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 64 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"

 


#line 70 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 71 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"

#line 89 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
#line 94 "C:/MCHPFSUSB/fw/Boot/system\usb\class\boot\boot.h"
