active cascode
.OPTIONS LIST NODE POST
.OP
.PRINT DC V(n1) V(n4) I1(M2)  

Vdd n4 0 DC 8V 
Vbias n5 0 DC 1.6V
Vi n1 0 DC 2.25V 
M1 n2 n1 0 0 CMOSN W = 10U L = 1.5U
M2 n4 n3 n2 0 CMOSN W = 10U L = 1.5U
Eopamp n3 0 OPAMP n5 n2 

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
