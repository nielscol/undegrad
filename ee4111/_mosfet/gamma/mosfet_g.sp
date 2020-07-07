mosfet i-v curve
.OPTIONS LIST NODE POST
.DC Vgs 0V 2.5V 5mV	Vbs 0 -3V 1V
.PRINT DC V(1) I1(M1)

Vgs 1 0 DC 3V
Vds 2 0 DC 0.1V
Vbs 3 0 DC 1V
M1 2 1 0 3 CMOSN W = 10U L = 1.5U

.MODEL CMOSN NMOS ( LEVEL = 3 
+ TOX = 1.4E-8  NSUB   = 1E17 GAMMA  = 0.5483559          
+ PHI = 0.7 VTO = 0.7640855 DELTA = 3.0541177 
+ UO = 662.6984452 ETA = 3.162045E-6 THETA  = 0.1013999          
+ KP  = 1.259355E-4 VMAX   = 1.442228E5 KAPPA  = 0.3             
+ RSH = 7.513418E-3  NFS = 1E12      TPG    = 1                     
+ XJ     = 3E-7  LD  = 1E-13  WD = 2.334779E-7
+ CGD = 2.15E-10 CGSO   = 2.15E-10   CGBO   = 1E-10        
+ C = 4.258447E-4 PB  = 0.914037   MJ     = 0.435903 
+ CJSW   = 3.147465E-10    MJSW   = 0.1977689       )                                     
*

.END
