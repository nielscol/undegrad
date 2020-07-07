**mos characterization
.TEMP 110 
**Use high temperature to simulate worst case delay and leakage power 

.print DC I1(M0) "-1*I1(M1)" LX18(M0) LX18(M1) LV9(M0) LV9(M1)
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

.include test_mos.sp 

.param VD = 1.1


vdd vdn 0 VD 
r1 vdn vdp 0

vgsn vgn 0 VD 
vgsp vgp 0 0

vbulkn vbn 0 0
vbulkp vbp 0 VD
 
.DC LEN! 45n 300n 5n
.end 