source coupled pair
.OPTIONS LIST NODE POST
.DC Vdiff -0.5 0.5 0.01 $differential voltage sweep
.PRINT DC PAR('V(n3)-V(n2)') PAR('V(n5) - V(n4)') I(Rd1) I(Rd2)

Vdd n1 0 DC 5 
Vss 0 n7 DC 5
Vdiff n10 0 DC 0
Ei1 n2 0 VOL = '-1*V(n10)'	$differential inputs
Ei2 n3 0 VOL = 'V(n10)'		
Rd1 n1 n4 25000
Rd2 n1 n5 25000
M1 n4 n2 n6 n7 CMOSN W = 10U L = 1.5U
M2 n5 n3 n6 n7 CMOSN W = 10U L = 1.5U
Itail n6 n7 DC 200uA

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

