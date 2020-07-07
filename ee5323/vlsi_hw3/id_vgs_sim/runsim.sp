**mos characterization
.TEMP 110 
**Use high temperature to simulate worst case delay and leakage power 

.print DC I1(M0) "-1*I1(M1)"
.OPTION 
+            ARTIST=2 
+            INGOLD=2 
+            MEASOUT=1 
+            PARHIER=LOCAL 
+            PSF=2 
+            LIST NODE POST

.inc '/home/class/niels538/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/NMOS_VTL.inc' 

.inc '/home/class/niels538/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/PMOS_VTL.inc' 

.include test_mos.sp 

.param VGS = 0
.param VD = 0

vdd vdn 0 VD 
r1 vdn vdp 0

vgsn vgn 0 VGS 
vgsp vdn vgp VGS

r2 vbn 0 0
r3 vbp 0 0
 
.DC VGS 0 1.1 0.01 SWEEP VD lin 6 0.2 1.2
.end 
