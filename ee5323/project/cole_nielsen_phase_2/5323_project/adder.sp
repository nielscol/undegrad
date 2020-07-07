** Generated for: hspiceD
** Generated on: Dec  8 16:55:59 2016
** Design library name: 5323_project
** Design cell name: adder_cap
** Design view name: schematic
.GLOBAL vdd!


** Library name: 5323_project
** Cell name: inv
** View name: schematic
.subckt inv a y
m0 y a 0 0 NMOS_VTL L=50e-9 W=100e-9
m1 y a vdd! vdd! PMOS_VTL L=50e-9 W=200e-9
.ends inv
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: buffer
** View name: schematic
.subckt buffer a y
xi1 net5 y inv
xi0 a net5 inv
.ends buffer
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: PG_buffer
** View name: schematic
.subckt PG_buffer gi go pi po
xi3 pi po buffer
xi2 gi go buffer
.ends PG_buffer
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: generate
** View name: schematic
.subckt generate a b c y
m3 y net11 0 0 NMOS_VTL L=50e-9 W=100e-9
m2 net11 a 0 0 NMOS_VTL L=50e-9 W=100e-9
m1 net22 c 0 0 NMOS_VTL L=50e-9 W=100e-9
m0 net11 b net22 0 NMOS_VTL L=50e-9 W=100e-9
m7 y net11 vdd! vdd! PMOS_VTL L=50e-9 W=200e-9
m6 net13 c vdd! vdd! PMOS_VTL L=50e-9 W=200e-9
m5 net13 b vdd! vdd! PMOS_VTL L=50e-9 W=200e-9
m4 net11 a net13 vdd! PMOS_VTL L=50e-9 W=200e-9
.ends generate
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: Group_G
** View name: schematic
.subckt Group_G gi__j gi__k _net0 pi__k
xi5 gi__k pi__k _net0 gi__j generate
.ends Group_G
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: nand
** View name: schematic
.subckt nand a b y
m1 y b vdd! vdd! PMOS_VTL L=200e-9 W=50e-9
m0 y a vdd! vdd! PMOS_VTL L=200e-9 W=50e-9
m3 net13 b 0 0 NMOS_VTL L=50e-9 W=100e-9
m2 y a net13 0 NMOS_VTL L=50e-9 W=100e-9
.ends nand
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: xor
** View name: schematic
.subckt xor a b y
m4 y a net18 0 NMOS_VTL L=50e-9 W=100e-9
m3 net18 b 0 0 NMOS_VTL L=50e-9 W=100e-9
m2 y net8 0 0 NMOS_VTL L=50e-9 W=100e-9
m1 net8 b 0 0 NMOS_VTL L=50e-9 W=100e-9
m0 net8 a 0 0 NMOS_VTL L=50e-9 W=100e-9
m9 net14 b vdd! vdd! PMOS_VTL L=50e-9 W=200e-9
m8 net14 a vdd! vdd! PMOS_VTL L=50e-9 W=200e-9
m7 y net8 net14 vdd! PMOS_VTL L=50e-9 W=200e-9
m6 net19 a vdd! vdd! PMOS_VTL L=50e-9 W=200e-9
m5 net8 b net19 vdd! PMOS_VTL L=50e-9 W=200e-9
.ends xor
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: init_PG
** View name: schematic
.subckt init_PG a b g p
xi0 a b net5 nand
xi1 a b p xor
xi2 net5 g inv
.ends init_PG
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: Group_PG
** View name: schematic
.subckt Group_PG gi__j gi__k _net1 pi__j pi__k _net0
xi0 pi__k _net0 net16 nand
xi3 net16 pi__j inv
xi7 gi__k pi__k _net1 gi__j generate
.ends Group_PG
** End of subcircuit definition.

** Library name: 5323_project
** Cell name: adder_cap
** View name: schematic
xi66 net168 go13 p13 po12 PG_buffer
xi65 net169 go11 p11 po10 PG_buffer
xi64 net170 go9 p9 po8 PG_buffer
xi52 net77 go7 p7 po6 PG_buffer
xi41 net84 go5 p5 po4 PG_buffer
xi37 net104 go3 p3 po2 PG_buffer
xi33 g14 net152 p14 po13 PG_buffer
xi29 g12 net154 p12 po11 PG_buffer
xi25 g10 net156 p10 po9 PG_buffer
xi21 g8 net158 p8 po7 PG_buffer
xi17 g6 net160 p6 po5 PG_buffer
xi13 g4 net162 p4 po3 PG_buffer
xi10 g2 net164 p2 po1 PG_buffer
xi2 net114 go1 p1 s_0 PG_buffer
xi63 go14 net152 net168 po13 Group_G
xi62 go12 net154 net169 po11 Group_G
xi61 go10 net156 net170 po9 Group_G
xi60 go8 net158 go7 po7 Group_G
xi59 go6 net160 go5 po5 Group_G
xi58 go4 net162 go3 po3 Group_G
xi57 go2 net164 go1 po1 Group_G
xi56 go15 net119 net77 net0138 Group_G
xi55 net168 net120 net84 net121 Group_G
xi54 net169 net123 go3 net122 Group_G
xi53 net170 net124 go1 net125 Group_G
xi47 net77 net92 net104 net89 Group_G
xi39 net84 net99 go1 net96 Group_G
xi36 net104 net111 net114 net108 Group_G
xi1 net114 g1 0 p1 Group_G
xi34 a_13 b_13 g14 p14 init_PG
xi31 a_14 b_14 g15 p15 init_PG
xi35 a_15 b_15 g16 p16 init_PG
xi30 a_11 b_11 g12 p12 init_PG
xi27 a_12 b_12 g13 p13 init_PG
xi26 a_9 b_9 g10 p10 init_PG
xi23 a_10 b_10 g11 p11 init_PG
xi22 a_7 b_7 g8 p8 init_PG
xi19 a_8 b_8 g9 p9 init_PG
xi18 a_5 b_5 g6 p6 init_PG
xi15 a_6 b_6 g7 p7 init_PG
xi14 a_3 b_3 g4 p4 init_PG
xi11 a_4 b_4 g5 p5 init_PG
xi9 a_1 b_1 g2 p2 init_PG
xi8 a_2 b_2 g3 p3 init_PG
xi6 a_0 b_0 g1 p1 init_PG
xi51 net119 net126 net78 net0138 net127 net75 Group_PG
xi50 net120 net128 net85 net121 net129 net82 Group_PG
xi49 net123 net78 net92 net122 net75 net89 Group_PG
xi48 net124 net85 net99 net125 net82 net96 Group_PG
xi46 net126 net130 net76 net127 net131 net73 Group_PG
xi45 net128 net76 net83 net129 net73 net80 Group_PG
xi44 net78 net83 net90 net75 net80 net87 Group_PG
xi43 net85 net90 net97 net82 net87 net94 Group_PG
xi42 net92 net97 net105 net89 net94 net102 Group_PG
xi38 net99 net105 net111 net96 net102 net108 Group_PG
xi32 net130 g15 g14 net131 p15 p14 Group_PG
xi28 net76 g13 g12 net73 p13 p12 Group_PG
xi24 net83 g11 g10 net80 p11 p10 Group_PG
xi20 net90 g9 g8 net87 p9 p8 Group_PG
xi16 net97 g7 g6 net94 p7 p6 Group_PG
xi12 net105 g5 g4 net102 p5 p4 Group_PG
xi7 net111 g3 g2 net108 p3 p2 Group_PG
xi81 go15 p16 s_15 xor
xi80 go14 p15 s_14 xor
xi79 go13 po13 s_13 xor
xi78 go12 po12 s_12 xor
xi77 go11 po11 s_11 xor
xi76 go10 po10 s_10 xor
xi75 go9 po9 s_9 xor
xi74 go8 po8 s_8 xor
xi73 go7 po7 s_7 xor
xi72 go6 po6 s_6 xor
xi71 go5 po5 s_5 xor
xi70 go4 po4 s_4 xor
xi69 go3 po3 s_3 xor
xi68 go2 po2 s_2 xor
xi67 go1 po1 s_1 xor
c157 p15 0 1.5e-15
c156 p14 0 1.5e-15
c155 g14 0 1.5e-15
c154 p13 0 1.5e-15
c153 g13 0 1.5e-15
c152 p12 0 1.5e-15
c151 g12 0 1.5e-15
c150 p11 0 1.5e-15
c149 g11 0 1.5e-15
c148 p10 0 1.5e-15
c147 g10 0 1.5e-15
c146 p9 0 1.5e-15
c145 g9 0 1.5e-15
c144 p8 0 1.5e-15
c143 g8 0 1.5e-15
c142 p7 0 1.5e-15
c141 g7 0 1.5e-15
c140 p6 0 1.5e-15
c139 g6 0 1.5e-15
c138 g5 0 1.5e-15
c137 p5 0 1.5e-15
c136 p4 0 1.5e-15
c135 g4 0 1.5e-15
c134 net114 0 1.5e-15
c133 net111 0 1.5e-15
c132 net108 0 1.5e-15
c131 net111 0 1.5e-15
c130 net108 0 1.5e-15
c129 net105 0 1.5e-15
c128 net102 0 1.5e-15
c127 net105 0 1.5e-15
c126 net102 0 1.5e-15
c125 net97 0 1.5e-15
c124 net94 0 1.5e-15
c123 net97 0 1.5e-15
c122 net94 0 1.5e-15
c121 net90 0 1.5e-15
c120 net87 0 1.5e-15
c119 net90 0 1.5e-15
c118 net87 0 1.5e-15
c117 net83 0 1.5e-15
c116 net80 0 1.5e-15
c115 net83 0 1.5e-15
c114 net80 0 1.5e-15
c113 net76 0 1.5e-15
c112 net73 0 1.5e-15
c111 net76 0 1.5e-15
c110 net73 0 1.5e-15
c109 net130 0 1.5e-15
c108 net131 0 1.5e-15
c107 net78 0 1.5e-15
c106 net75 0 1.5e-15
c105 net126 0 1.5e-15
c104 net127 0 1.5e-15
c103 net129 0 1.5e-15
c102 net128 0 1.5e-15
c101 net82 0 1.5e-15
c100 net85 0 1.5e-15
c98 net75 0 1.5e-15
c97 net78 0 1.5e-15
c96 net89 0 1.5e-15
c95 net92 0 1.5e-15
c94 net82 0 1.5e-15
c93 net85 0 1.5e-15
c92 net96 0 1.5e-15
c91 net99 0 1.5e-15
c90 net89 0 1.5e-15
c89 net92 0 1.5e-15
c88 net104 0 1.5e-15
c87 net96 0 1.5e-15
c86 net99 0 1.5e-15
c85 go1 0 1.5e-15
c84 net104 0 1.5e-15
c83 p3 0 1.5e-15
c82 net84 0 1.5e-15
c81 p5 0 1.5e-15
c80 net77 0 1.5e-15
c79 p7 0 1.5e-15
c78 net158 0 1.5e-15
c77 net156 0 1.5e-15
c76 go1 0 1.5e-15
c75 net124 0 1.5e-15
c74 net125 0 1.5e-15
c73 go3 0 1.5e-15
c72 net123 0 1.5e-15
c71 net122 0 1.5e-15
c70 net154 0 1.5e-15
c69 net84 0 1.5e-15
c68 net120 0 1.5e-15
c67 net121 0 1.5e-15
c66 p13 0 1.5e-15
c65 net75 0 1.5e-15
c64 net78 0 1.5e-15
c63 net152 0 1.5e-15
c62 net77 0 1.5e-15
c61 net119 0 1.5e-15
c60 net0138 0 1.5e-15
c59 go3 0 1.5e-15
c58 po3 0 1.5e-15
c57 go4 0 1.5e-15
c56 po4 0 1.5e-15
c55 go5 0 1.5e-15
c54 po5 0 1.5e-15
c53 go6 0 1.5e-15
c52 po6 0 1.5e-15
c51 go7 0 1.5e-15
c50 po7 0 1.5e-15
c49 go8 0 1.5e-15
c48 po8 0 1.5e-15
c47 go9 0 1.5e-15
c46 p9 0 1.5e-15
c45 net170 0 1.5e-15
c44 po9 0 1.5e-15
c43 go10 0 1.5e-15
c42 p11 0 1.5e-15
c40 po10 0 1.5e-15
c39 go11 0 1.5e-15
c37 net169 0 1.5e-15
c36 po11 0 1.5e-15
c35 go12 0 1.5e-15
c34 net168 0 1.5e-15
c33 po13 0 1.5e-15
c32 po12 0 1.5e-15
c31 go13 0 1.5e-15
c30 go14 0 1.5e-15
c29 g16 0 1.5e-15
c28 p16 0 1.5e-15
c27 go15 0 1.5e-15
c26 cout 0 1.5e-15
c25 s_15 0 1.5e-15
c24 s_14 0 1.5e-15
c23 s_13 0 1.5e-15
c22 s_12 0 1.5e-15
c21 s_11 0 1.5e-15
c20 s_10 0 1.5e-15
c19 s_9 0 1.5e-15
c18 s_8 0 1.5e-15
c17 s_7 0 1.5e-15
c16 s_6 0 1.5e-15
c15 s_5 0 1.5e-15
c14 s_4 0 1.5e-15
c13 s_3 0 1.5e-15
c12 s_2 0 1.5e-15
c11 s_1 0 1.5e-15
c10 g2 0 1.5e-15
c9 p2 0 1.5e-15
c8 po2 0 1.5e-15
c7 go2 0 1.5e-15
c6 po1 0 1.5e-15
c5 go1 0 1.5e-15
c4 go1 0 1.5e-15
c3 go1 0 1.5e-15
c2 g1 0 1.5e-15
c1 net114 0 1.5e-15
c0 p1 0 1.5e-15
xi86 g16 p16 go15 cout generate
.END

