#line 1 "usbmmap.c"
#line 1 "usbmmap.c"

#line 35 "usbmmap.c"
 


#line 149 "usbmmap.c"
 

 
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
#line 152 "usbmmap.c"

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
