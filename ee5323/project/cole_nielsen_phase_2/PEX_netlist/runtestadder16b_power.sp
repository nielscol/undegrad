*TEST 16-BIT ADDER
.TEMP 110
.OPTIONS ACCURATE
.OPTIONS POST=2

.INCLUDE '~/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/NMOS_VTL.inc'
.INCLUDE '~/FreePDK45/ncsu_basekit/models/hspice/tran_models/models_nom/PMOS_VTL.inc' 

.INCLUDE adder16b.sp
.INCLUDE testadder16b.sp
.VEC 'digital_vector_power'
.PARAM PERIOD = 2NS
.PARAM T0= 0.1NS
.PARAM T1= T0+1000*PERIOD
.PARAM T2= T1+0.1NS
.PARAM STEP= 1PS

*REPLACE "1.5NS" IN THE NEXT LINE WITH THE MEASURED WORST CASE DELAY OF YOUR OWN DESIGN
.PARAM DELAY_MAX= 1.5NS

VDD   VDD! 0 1.1
VGND  GND! 0 0
.TRAN STEP T2

.MEASURE TOT_POWER AVG POWER FROM T0 TO T1

* THE POWER AT MAX FREQUENCY CAN BE CALCULATED BY DIVIDING THE SWITCHING ENERGY BY THE SWITCHING TIME
* YOU ONLY NEED TO REPORT THE POWER_AT_MAX VALUE. YOU DON'T NEED TO REPORT THE TOT_POWER VALUE
.MEASURE POWER_AT_MAX PARAM='TOT_POWER*PERIOD/DELAY_MAX'

.END







