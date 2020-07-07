**HAN-CARLSON ADDER - 16 bit
.TEMP 110 

.OPTION 
+            ARTIST=2 
+            INGOLD=2 
+            MEASOUT=1 
+            PARHIER=LOCAL 
+            PSF=2 
+            LIST NODE POST
+	     dccap=1

.inc '/home/class/niels538/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/NMOS_VTL.inc' 
.inc '/home/class/niels538/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/PMOS_VTL.inc' 
.include adder.sp 

**********************************************************************
.PARAM assert=100p
.PARAM pw = 2n
.PARAM period = 4n
vdd vdd! 0 1.1v
****0		 DC 0V
****1		 DC 1.1V
****1-0		 PULSE (1.1 0 assert 0 0 pw period)
****0-1		 PULSE (0 1.1 assert 0 0 pw period)

VA0 A_0 0 PULSE (0 1.1 assert 0 0 pw period)
VA1 A_1 0 PULSE (0 1.1 assert 0 0 pw period)
VA2 A_2 0 DC 0V
VA3 A_3 0 PULSE (0 1.1 assert 0 0 pw period)

VA4 A_4 0 DC 0V
VA5 A_5 0 DC 0V
VA6 A_6 0 PULSE (0 1.1 assert 0 0 pw period)
VA7 A_7 0 PULSE (0 1.1 assert 0 0 pw period)

VA8 A_8 0 PULSE (0 1.1 assert 0 0 pw period)
VA9 A_9 0 DC 0V
VA10 A_10 0 PULSE (0 1.1 assert 0 0 pw period)
VA11 A_11 0 PULSE (0 1.1 assert 0 0 pw period)

VA12 A_12 0 PULSE (0 1.1 assert 0 0 pw period)
VA13 A_13 0 PULSE (0 1.1 assert 0 0 pw period)
VA14 A_14 0 PULSE (0 1.1 assert 0 0 pw period)
VA15 A_15 0 DC 0V



VB0 B_0 0 DC 0V
VB1 B_1 0 PULSE (0 1.1 assert 0 0 pw period)
VB2 B_2 0 DC 0V
VB3 B_3 0 PULSE (0 1.1 assert 0 0 pw period)

VB4 B_4 0 PULSE (0 1.1 assert 0 0 pw period)
VB5 B_5 0 DC 0V
VB6 B_6 0 PULSE (0 1.1 assert 0 0 pw period)
VB7 B_7 0 PULSE (0 1.1 assert 0 0 pw period)

VB8 B_8 0 DC 0V
VB9 B_9 0 DC 0V
VB10 B_10 0 DC 0V
VB11 B_11 0 PULSE (0 1.1 assert 0 0 pw period)

VB12 B_12 0 PULSE (0 1.1 assert 0 0 pw period)
VB13 B_13 0 DC 0V
VB14 B_14 0 PULSE (0 1.1 assert 0 0 pw period)
VB15 B_15 0 DC 0V

**********************************************************************

.op
.tran 0.1p 1000p
**********************************************************************
.end 
