*test_mos devices
.GLOBAL LEN!

m0 vdn vgn 0 vbn NMOS_VTL L=LEN! W=360e-9
m1 0 vgp vdp vbp PMOS_VTL L=LEN! W=360e-9
.END