////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.61xd
//  \   \         Application: netgen
//  /   /         Filename: fourbit_addsub_synthesis.v
// /___/   /\     Timestamp: Fri Sep 11 14:31:20 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim fourbit_addsub.ngc fourbit_addsub_synthesis.v 
// Device	: xc3s100e-4-cp132
// Input file	: fourbit_addsub.ngc
// Output file	: \\ece-squid.ad.umn.edu\ee-labs$\niels538\lab1_adder_verilog\netgen\synthesis\fourbit_addsub_synthesis.v
// # of Modules	: 1
// Design Name	: fourbit_addsub
// Xilinx        : C:\Xilinx\13.2\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module fourbit_addsub (
  cout, sub, s, a, b
);
  output cout;
  input sub;
  output [3 : 0] s;
  input [3 : 0] a;
  input [3 : 0] b;
  wire a_0_IBUF_4;
  wire a_1_IBUF_5;
  wire a_2_IBUF_6;
  wire a_3_IBUF_7;
  wire b_0_IBUF_12;
  wire b_1_IBUF_13;
  wire b_2_IBUF_14;
  wire b_3_IBUF_15;
  wire cout_OBUF_20;
  wire s_0_OBUF_25;
  wire s_1_OBUF_26;
  wire s_2_OBUF_27;
  wire s_3_OBUF_28;
  wire sub_IBUF_30;
  wire [3 : 1] carry;
  LUT2 #(
    .INIT ( 4'h6 ))
  \FA0/Mxor_sum_xo<0>1  (
    .I0(a_0_IBUF_4),
    .I1(b_0_IBUF_12),
    .O(s_0_OBUF_25)
  );
  LUT4 #(
    .INIT ( 16'h6996 ))
  \FA1/Mxor_sum_xo<0>1  (
    .I0(a_1_IBUF_5),
    .I1(b_1_IBUF_13),
    .I2(carry[1]),
    .I3(sub_IBUF_30),
    .O(s_1_OBUF_26)
  );
  LUT4 #(
    .INIT ( 16'h6996 ))
  \FA2/Mxor_sum_xo<0>1  (
    .I0(a_2_IBUF_6),
    .I1(b_2_IBUF_14),
    .I2(carry[2]),
    .I3(sub_IBUF_30),
    .O(s_2_OBUF_27)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \FA0/cout1  (
    .I0(b_0_IBUF_12),
    .I1(sub_IBUF_30),
    .I2(a_0_IBUF_4),
    .O(carry[1])
  );
  LUT4 #(
    .INIT ( 16'hBE28 ))
  \FA3/cout1  (
    .I0(a_3_IBUF_7),
    .I1(b_3_IBUF_15),
    .I2(sub_IBUF_30),
    .I3(carry[3]),
    .O(cout_OBUF_20)
  );
  LUT4 #(
    .INIT ( 16'hBE28 ))
  \FA2/cout1  (
    .I0(a_2_IBUF_6),
    .I1(b_2_IBUF_14),
    .I2(sub_IBUF_30),
    .I3(carry[2]),
    .O(carry[3])
  );
  LUT4 #(
    .INIT ( 16'hBE28 ))
  \FA1/cout1  (
    .I0(a_1_IBUF_5),
    .I1(b_1_IBUF_13),
    .I2(sub_IBUF_30),
    .I3(carry[1]),
    .O(carry[2])
  );
  LUT4 #(
    .INIT ( 16'h6996 ))
  \FA3/Mxor_sum_xo<0>1  (
    .I0(a_3_IBUF_7),
    .I1(b_3_IBUF_15),
    .I2(carry[3]),
    .I3(sub_IBUF_30),
    .O(s_3_OBUF_28)
  );
  IBUF   sub_IBUF (
    .I(sub),
    .O(sub_IBUF_30)
  );
  IBUF   a_3_IBUF (
    .I(a[3]),
    .O(a_3_IBUF_7)
  );
  IBUF   a_2_IBUF (
    .I(a[2]),
    .O(a_2_IBUF_6)
  );
  IBUF   a_1_IBUF (
    .I(a[1]),
    .O(a_1_IBUF_5)
  );
  IBUF   a_0_IBUF (
    .I(a[0]),
    .O(a_0_IBUF_4)
  );
  IBUF   b_3_IBUF (
    .I(b[3]),
    .O(b_3_IBUF_15)
  );
  IBUF   b_2_IBUF (
    .I(b[2]),
    .O(b_2_IBUF_14)
  );
  IBUF   b_1_IBUF (
    .I(b[1]),
    .O(b_1_IBUF_13)
  );
  IBUF   b_0_IBUF (
    .I(b[0]),
    .O(b_0_IBUF_12)
  );
  OBUF   cout_OBUF (
    .I(cout_OBUF_20),
    .O(cout)
  );
  OBUF   s_3_OBUF (
    .I(s_3_OBUF_28),
    .O(s[3])
  );
  OBUF   s_2_OBUF (
    .I(s_2_OBUF_27),
    .O(s[2])
  );
  OBUF   s_1_OBUF (
    .I(s_1_OBUF_26),
    .O(s[1])
  );
  OBUF   s_0_OBUF (
    .I(s_0_OBUF_25),
    .O(s[0])
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

