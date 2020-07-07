////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.61xd
//  \   \         Application: netgen
//  /   /         Filename: counter_3bit_synthesis.v
// /___/   /\     Timestamp: Fri Oct 09 14:22:48 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim counter_3bit.ngc counter_3bit_synthesis.v 
// Device	: xc3s100e-4-cp132
// Input file	: counter_3bit.ngc
// Output file	: \\ece-squid.ad.umn.edu\ee-labs$\niels538\lab3\three_bit_count\netgen\synthesis\counter_3bit_synthesis.v
// # of Modules	: 1
// Design Name	: counter_3bit
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

module counter_3bit (
  clock_in, f_, g_, a, b, Q0, c, Q1, d, Q2, e
);
  input clock_in;
  output f_;
  output g_;
  output a;
  output b;
  output Q0;
  output c;
  output Q1;
  output d;
  output Q2;
  output e;
  wire N0;
  wire N1;
  wire Q0_OBUF_3;
  wire Q1_OBUF_5;
  wire Q2_OBUF_7;
  wire a_OBUF_9;
  wire b_OBUF_11;
  wire c_OBUF_13;
  wire \clock/Madd_count2_addsub0000_cy<10>_rt_16 ;
  wire \clock/Madd_count2_addsub0000_cy<11>_rt_18 ;
  wire \clock/Madd_count2_addsub0000_cy<12>_rt_20 ;
  wire \clock/Madd_count2_addsub0000_cy<13>_rt_22 ;
  wire \clock/Madd_count2_addsub0000_cy<14>_rt_24 ;
  wire \clock/Madd_count2_addsub0000_cy<15>_rt_26 ;
  wire \clock/Madd_count2_addsub0000_cy<16>_rt_28 ;
  wire \clock/Madd_count2_addsub0000_cy<17>_rt_30 ;
  wire \clock/Madd_count2_addsub0000_cy<18>_rt_32 ;
  wire \clock/Madd_count2_addsub0000_cy<19>_rt_34 ;
  wire \clock/Madd_count2_addsub0000_cy<1>_rt_36 ;
  wire \clock/Madd_count2_addsub0000_cy<20>_rt_38 ;
  wire \clock/Madd_count2_addsub0000_cy<21>_rt_40 ;
  wire \clock/Madd_count2_addsub0000_cy<22>_rt_42 ;
  wire \clock/Madd_count2_addsub0000_cy<23>_rt_44 ;
  wire \clock/Madd_count2_addsub0000_cy<24>_rt_46 ;
  wire \clock/Madd_count2_addsub0000_cy<25>_rt_48 ;
  wire \clock/Madd_count2_addsub0000_cy<26>_rt_50 ;
  wire \clock/Madd_count2_addsub0000_cy<27>_rt_52 ;
  wire \clock/Madd_count2_addsub0000_cy<28>_rt_54 ;
  wire \clock/Madd_count2_addsub0000_cy<29>_rt_56 ;
  wire \clock/Madd_count2_addsub0000_cy<2>_rt_58 ;
  wire \clock/Madd_count2_addsub0000_cy<30>_rt_60 ;
  wire \clock/Madd_count2_addsub0000_cy<3>_rt_62 ;
  wire \clock/Madd_count2_addsub0000_cy<4>_rt_64 ;
  wire \clock/Madd_count2_addsub0000_cy<5>_rt_66 ;
  wire \clock/Madd_count2_addsub0000_cy<6>_rt_68 ;
  wire \clock/Madd_count2_addsub0000_cy<7>_rt_70 ;
  wire \clock/Madd_count2_addsub0000_cy<8>_rt_72 ;
  wire \clock/Madd_count2_addsub0000_cy<9>_rt_74 ;
  wire \clock/Madd_count2_addsub0000_xor<31>_rt_76 ;
  wire \clock/Madd_count3_addsub0000_cy<10>_rt_79 ;
  wire \clock/Madd_count3_addsub0000_cy<11>_rt_81 ;
  wire \clock/Madd_count3_addsub0000_cy<12>_rt_83 ;
  wire \clock/Madd_count3_addsub0000_cy<13>_rt_85 ;
  wire \clock/Madd_count3_addsub0000_cy<14>_rt_87 ;
  wire \clock/Madd_count3_addsub0000_cy<15>_rt_89 ;
  wire \clock/Madd_count3_addsub0000_cy<16>_rt_91 ;
  wire \clock/Madd_count3_addsub0000_cy<17>_rt_93 ;
  wire \clock/Madd_count3_addsub0000_cy<18>_rt_95 ;
  wire \clock/Madd_count3_addsub0000_cy<19>_rt_97 ;
  wire \clock/Madd_count3_addsub0000_cy<1>_rt_99 ;
  wire \clock/Madd_count3_addsub0000_cy<20>_rt_101 ;
  wire \clock/Madd_count3_addsub0000_cy<21>_rt_103 ;
  wire \clock/Madd_count3_addsub0000_cy<22>_rt_105 ;
  wire \clock/Madd_count3_addsub0000_cy<23>_rt_107 ;
  wire \clock/Madd_count3_addsub0000_cy<24>_rt_109 ;
  wire \clock/Madd_count3_addsub0000_cy<25>_rt_111 ;
  wire \clock/Madd_count3_addsub0000_cy<26>_rt_113 ;
  wire \clock/Madd_count3_addsub0000_cy<27>_rt_115 ;
  wire \clock/Madd_count3_addsub0000_cy<28>_rt_117 ;
  wire \clock/Madd_count3_addsub0000_cy<29>_rt_119 ;
  wire \clock/Madd_count3_addsub0000_cy<2>_rt_121 ;
  wire \clock/Madd_count3_addsub0000_cy<30>_rt_123 ;
  wire \clock/Madd_count3_addsub0000_cy<3>_rt_125 ;
  wire \clock/Madd_count3_addsub0000_cy<4>_rt_127 ;
  wire \clock/Madd_count3_addsub0000_cy<5>_rt_129 ;
  wire \clock/Madd_count3_addsub0000_cy<6>_rt_131 ;
  wire \clock/Madd_count3_addsub0000_cy<7>_rt_133 ;
  wire \clock/Madd_count3_addsub0000_cy<8>_rt_135 ;
  wire \clock/Madd_count3_addsub0000_cy<9>_rt_137 ;
  wire \clock/Madd_count3_addsub0000_xor<31>_rt_139 ;
  wire \clock/Mcount_count0_cy<10>_rt_142 ;
  wire \clock/Mcount_count0_cy<11>_rt_144 ;
  wire \clock/Mcount_count0_cy<12>_rt_146 ;
  wire \clock/Mcount_count0_cy<13>_rt_148 ;
  wire \clock/Mcount_count0_cy<14>_rt_150 ;
  wire \clock/Mcount_count0_cy<15>_rt_152 ;
  wire \clock/Mcount_count0_cy<16>_rt_154 ;
  wire \clock/Mcount_count0_cy<17>_rt_156 ;
  wire \clock/Mcount_count0_cy<18>_rt_158 ;
  wire \clock/Mcount_count0_cy<19>_rt_160 ;
  wire \clock/Mcount_count0_cy<1>_rt_162 ;
  wire \clock/Mcount_count0_cy<20>_rt_164 ;
  wire \clock/Mcount_count0_cy<21>_rt_166 ;
  wire \clock/Mcount_count0_cy<22>_rt_168 ;
  wire \clock/Mcount_count0_cy<23>_rt_170 ;
  wire \clock/Mcount_count0_cy<24>_rt_172 ;
  wire \clock/Mcount_count0_cy<25>_rt_174 ;
  wire \clock/Mcount_count0_cy<26>_rt_176 ;
  wire \clock/Mcount_count0_cy<27>_rt_178 ;
  wire \clock/Mcount_count0_cy<28>_rt_180 ;
  wire \clock/Mcount_count0_cy<29>_rt_182 ;
  wire \clock/Mcount_count0_cy<2>_rt_184 ;
  wire \clock/Mcount_count0_cy<30>_rt_186 ;
  wire \clock/Mcount_count0_cy<3>_rt_188 ;
  wire \clock/Mcount_count0_cy<4>_rt_190 ;
  wire \clock/Mcount_count0_cy<5>_rt_192 ;
  wire \clock/Mcount_count0_cy<6>_rt_194 ;
  wire \clock/Mcount_count0_cy<7>_rt_196 ;
  wire \clock/Mcount_count0_cy<8>_rt_198 ;
  wire \clock/Mcount_count0_cy<9>_rt_200 ;
  wire \clock/Mcount_count0_xor<31>_rt_202 ;
  wire \clock/Mcount_count1_cy<10>_rt_205 ;
  wire \clock/Mcount_count1_cy<11>_rt_207 ;
  wire \clock/Mcount_count1_cy<12>_rt_209 ;
  wire \clock/Mcount_count1_cy<13>_rt_211 ;
  wire \clock/Mcount_count1_cy<14>_rt_213 ;
  wire \clock/Mcount_count1_cy<15>_rt_215 ;
  wire \clock/Mcount_count1_cy<16>_rt_217 ;
  wire \clock/Mcount_count1_cy<17>_rt_219 ;
  wire \clock/Mcount_count1_cy<18>_rt_221 ;
  wire \clock/Mcount_count1_cy<19>_rt_223 ;
  wire \clock/Mcount_count1_cy<1>_rt_225 ;
  wire \clock/Mcount_count1_cy<20>_rt_227 ;
  wire \clock/Mcount_count1_cy<21>_rt_229 ;
  wire \clock/Mcount_count1_cy<22>_rt_231 ;
  wire \clock/Mcount_count1_cy<23>_rt_233 ;
  wire \clock/Mcount_count1_cy<24>_rt_235 ;
  wire \clock/Mcount_count1_cy<25>_rt_237 ;
  wire \clock/Mcount_count1_cy<26>_rt_239 ;
  wire \clock/Mcount_count1_cy<27>_rt_241 ;
  wire \clock/Mcount_count1_cy<28>_rt_243 ;
  wire \clock/Mcount_count1_cy<29>_rt_245 ;
  wire \clock/Mcount_count1_cy<2>_rt_247 ;
  wire \clock/Mcount_count1_cy<30>_rt_249 ;
  wire \clock/Mcount_count1_cy<3>_rt_251 ;
  wire \clock/Mcount_count1_cy<4>_rt_253 ;
  wire \clock/Mcount_count1_cy<5>_rt_255 ;
  wire \clock/Mcount_count1_cy<6>_rt_257 ;
  wire \clock/Mcount_count1_cy<7>_rt_259 ;
  wire \clock/Mcount_count1_cy<8>_rt_261 ;
  wire \clock/Mcount_count1_cy<9>_rt_263 ;
  wire \clock/Mcount_count1_xor<31>_rt_265 ;
  wire \clock/Result<0>1 ;
  wire \clock/Result<10>1 ;
  wire \clock/Result<11>1 ;
  wire \clock/Result<12>1 ;
  wire \clock/Result<13>1 ;
  wire \clock/Result<14>1 ;
  wire \clock/Result<15>1 ;
  wire \clock/Result<16>1 ;
  wire \clock/Result<17>1 ;
  wire \clock/Result<18>1 ;
  wire \clock/Result<19>1 ;
  wire \clock/Result<1>1 ;
  wire \clock/Result<20>1 ;
  wire \clock/Result<21>1 ;
  wire \clock/Result<22>1 ;
  wire \clock/Result<23>1 ;
  wire \clock/Result<24>1 ;
  wire \clock/Result<25>1 ;
  wire \clock/Result<26>1 ;
  wire \clock/Result<27>1 ;
  wire \clock/Result<28>1 ;
  wire \clock/Result<29>1 ;
  wire \clock/Result<2>1 ;
  wire \clock/Result<30>1 ;
  wire \clock/Result<31>1 ;
  wire \clock/Result<3>1 ;
  wire \clock/Result<4>1 ;
  wire \clock/Result<5>1 ;
  wire \clock/Result<6>1 ;
  wire \clock/Result<7>1 ;
  wire \clock/Result<8>1 ;
  wire \clock/Result<9>1 ;
  wire \clock/count0_cmp_eq0000 ;
  wire \clock/count1_and0000 ;
  wire \clock/count2_cmp_eq0000 ;
  wire \clock/count2_not0001 ;
  wire \clock/count3_and0001 ;
  wire \clock/count3_cmp_eq0000 ;
  wire \clock/count3_not0001 ;
  wire \clock/cout_652 ;
  wire \clock/d_653 ;
  wire \clock/d_not0002 ;
  wire \clock/d_not0003 ;
  wire clock_in_BUFGP_657;
  wire d_OBUF_659;
  wire e_OBUF_661;
  wire f__OBUF_663;
  wire g__OBUF_665;
  wire \tff1/d_666 ;
  wire \tff2/d_667 ;
  wire \tff3/d_668 ;
  wire [30 : 0] \clock/Madd_count2_addsub0000_cy ;
  wire [0 : 0] \clock/Madd_count2_addsub0000_lut ;
  wire [30 : 0] \clock/Madd_count3_addsub0000_cy ;
  wire [0 : 0] \clock/Madd_count3_addsub0000_lut ;
  wire [30 : 0] \clock/Mcount_count0_cy ;
  wire [0 : 0] \clock/Mcount_count0_lut ;
  wire [30 : 0] \clock/Mcount_count1_cy ;
  wire [0 : 0] \clock/Mcount_count1_lut ;
  wire [31 : 0] \clock/Result ;
  wire [31 : 0] \clock/count0 ;
  wire [5 : 0] \clock/count0_cmp_eq0000_wg_cy ;
  wire [7 : 0] \clock/count0_cmp_eq0000_wg_lut ;
  wire [31 : 0] \clock/count1 ;
  wire [31 : 0] \clock/count2 ;
  wire [31 : 0] \clock/count2_addsub0000 ;
  wire [6 : 0] \clock/count2_cmp_eq0000_wg_cy ;
  wire [7 : 0] \clock/count2_cmp_eq0000_wg_lut ;
  wire [31 : 0] \clock/count2_mux0000 ;
  wire [31 : 0] \clock/count3 ;
  wire [31 : 0] \clock/count3_addsub0000 ;
  wire [6 : 0] \clock/count3_and0001_wg_cy ;
  wire [7 : 0] \clock/count3_and0001_wg_lut ;
  wire [6 : 0] \clock/count3_cmp_eq0000_wg_cy ;
  wire [7 : 0] \clock/count3_cmp_eq0000_wg_lut ;
  wire [31 : 0] \clock/count3_mux0000 ;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  \tff3/d  (
    .C(Q1_OBUF_5),
    .CE(N1),
    .D(Q2_OBUF_7),
    .Q(\tff3/d_668 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \tff2/d  (
    .C(Q0_OBUF_3),
    .CE(N1),
    .D(Q1_OBUF_5),
    .Q(\tff2/d_667 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \tff1/d  (
    .C(\clock/cout_652 ),
    .CE(N1),
    .D(Q0_OBUF_3),
    .Q(\tff1/d_666 )
  );
  XORCY   \clock/Mcount_count1_xor<31>  (
    .CI(\clock/Mcount_count1_cy [30]),
    .LI(\clock/Mcount_count1_xor<31>_rt_265 ),
    .O(\clock/Result<31>1 )
  );
  XORCY   \clock/Mcount_count1_xor<30>  (
    .CI(\clock/Mcount_count1_cy [29]),
    .LI(\clock/Mcount_count1_cy<30>_rt_249 ),
    .O(\clock/Result<30>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<30>  (
    .CI(\clock/Mcount_count1_cy [29]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<30>_rt_249 ),
    .O(\clock/Mcount_count1_cy [30])
  );
  XORCY   \clock/Mcount_count1_xor<29>  (
    .CI(\clock/Mcount_count1_cy [28]),
    .LI(\clock/Mcount_count1_cy<29>_rt_245 ),
    .O(\clock/Result<29>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<29>  (
    .CI(\clock/Mcount_count1_cy [28]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<29>_rt_245 ),
    .O(\clock/Mcount_count1_cy [29])
  );
  XORCY   \clock/Mcount_count1_xor<28>  (
    .CI(\clock/Mcount_count1_cy [27]),
    .LI(\clock/Mcount_count1_cy<28>_rt_243 ),
    .O(\clock/Result<28>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<28>  (
    .CI(\clock/Mcount_count1_cy [27]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<28>_rt_243 ),
    .O(\clock/Mcount_count1_cy [28])
  );
  XORCY   \clock/Mcount_count1_xor<27>  (
    .CI(\clock/Mcount_count1_cy [26]),
    .LI(\clock/Mcount_count1_cy<27>_rt_241 ),
    .O(\clock/Result<27>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<27>  (
    .CI(\clock/Mcount_count1_cy [26]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<27>_rt_241 ),
    .O(\clock/Mcount_count1_cy [27])
  );
  XORCY   \clock/Mcount_count1_xor<26>  (
    .CI(\clock/Mcount_count1_cy [25]),
    .LI(\clock/Mcount_count1_cy<26>_rt_239 ),
    .O(\clock/Result<26>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<26>  (
    .CI(\clock/Mcount_count1_cy [25]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<26>_rt_239 ),
    .O(\clock/Mcount_count1_cy [26])
  );
  XORCY   \clock/Mcount_count1_xor<25>  (
    .CI(\clock/Mcount_count1_cy [24]),
    .LI(\clock/Mcount_count1_cy<25>_rt_237 ),
    .O(\clock/Result<25>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<25>  (
    .CI(\clock/Mcount_count1_cy [24]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<25>_rt_237 ),
    .O(\clock/Mcount_count1_cy [25])
  );
  XORCY   \clock/Mcount_count1_xor<24>  (
    .CI(\clock/Mcount_count1_cy [23]),
    .LI(\clock/Mcount_count1_cy<24>_rt_235 ),
    .O(\clock/Result<24>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<24>  (
    .CI(\clock/Mcount_count1_cy [23]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<24>_rt_235 ),
    .O(\clock/Mcount_count1_cy [24])
  );
  XORCY   \clock/Mcount_count1_xor<23>  (
    .CI(\clock/Mcount_count1_cy [22]),
    .LI(\clock/Mcount_count1_cy<23>_rt_233 ),
    .O(\clock/Result<23>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<23>  (
    .CI(\clock/Mcount_count1_cy [22]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<23>_rt_233 ),
    .O(\clock/Mcount_count1_cy [23])
  );
  XORCY   \clock/Mcount_count1_xor<22>  (
    .CI(\clock/Mcount_count1_cy [21]),
    .LI(\clock/Mcount_count1_cy<22>_rt_231 ),
    .O(\clock/Result<22>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<22>  (
    .CI(\clock/Mcount_count1_cy [21]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<22>_rt_231 ),
    .O(\clock/Mcount_count1_cy [22])
  );
  XORCY   \clock/Mcount_count1_xor<21>  (
    .CI(\clock/Mcount_count1_cy [20]),
    .LI(\clock/Mcount_count1_cy<21>_rt_229 ),
    .O(\clock/Result<21>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<21>  (
    .CI(\clock/Mcount_count1_cy [20]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<21>_rt_229 ),
    .O(\clock/Mcount_count1_cy [21])
  );
  XORCY   \clock/Mcount_count1_xor<20>  (
    .CI(\clock/Mcount_count1_cy [19]),
    .LI(\clock/Mcount_count1_cy<20>_rt_227 ),
    .O(\clock/Result<20>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<20>  (
    .CI(\clock/Mcount_count1_cy [19]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<20>_rt_227 ),
    .O(\clock/Mcount_count1_cy [20])
  );
  XORCY   \clock/Mcount_count1_xor<19>  (
    .CI(\clock/Mcount_count1_cy [18]),
    .LI(\clock/Mcount_count1_cy<19>_rt_223 ),
    .O(\clock/Result<19>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<19>  (
    .CI(\clock/Mcount_count1_cy [18]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<19>_rt_223 ),
    .O(\clock/Mcount_count1_cy [19])
  );
  XORCY   \clock/Mcount_count1_xor<18>  (
    .CI(\clock/Mcount_count1_cy [17]),
    .LI(\clock/Mcount_count1_cy<18>_rt_221 ),
    .O(\clock/Result<18>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<18>  (
    .CI(\clock/Mcount_count1_cy [17]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<18>_rt_221 ),
    .O(\clock/Mcount_count1_cy [18])
  );
  XORCY   \clock/Mcount_count1_xor<17>  (
    .CI(\clock/Mcount_count1_cy [16]),
    .LI(\clock/Mcount_count1_cy<17>_rt_219 ),
    .O(\clock/Result<17>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<17>  (
    .CI(\clock/Mcount_count1_cy [16]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<17>_rt_219 ),
    .O(\clock/Mcount_count1_cy [17])
  );
  XORCY   \clock/Mcount_count1_xor<16>  (
    .CI(\clock/Mcount_count1_cy [15]),
    .LI(\clock/Mcount_count1_cy<16>_rt_217 ),
    .O(\clock/Result<16>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<16>  (
    .CI(\clock/Mcount_count1_cy [15]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<16>_rt_217 ),
    .O(\clock/Mcount_count1_cy [16])
  );
  XORCY   \clock/Mcount_count1_xor<15>  (
    .CI(\clock/Mcount_count1_cy [14]),
    .LI(\clock/Mcount_count1_cy<15>_rt_215 ),
    .O(\clock/Result<15>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<15>  (
    .CI(\clock/Mcount_count1_cy [14]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<15>_rt_215 ),
    .O(\clock/Mcount_count1_cy [15])
  );
  XORCY   \clock/Mcount_count1_xor<14>  (
    .CI(\clock/Mcount_count1_cy [13]),
    .LI(\clock/Mcount_count1_cy<14>_rt_213 ),
    .O(\clock/Result<14>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<14>  (
    .CI(\clock/Mcount_count1_cy [13]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<14>_rt_213 ),
    .O(\clock/Mcount_count1_cy [14])
  );
  XORCY   \clock/Mcount_count1_xor<13>  (
    .CI(\clock/Mcount_count1_cy [12]),
    .LI(\clock/Mcount_count1_cy<13>_rt_211 ),
    .O(\clock/Result<13>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<13>  (
    .CI(\clock/Mcount_count1_cy [12]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<13>_rt_211 ),
    .O(\clock/Mcount_count1_cy [13])
  );
  XORCY   \clock/Mcount_count1_xor<12>  (
    .CI(\clock/Mcount_count1_cy [11]),
    .LI(\clock/Mcount_count1_cy<12>_rt_209 ),
    .O(\clock/Result<12>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<12>  (
    .CI(\clock/Mcount_count1_cy [11]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<12>_rt_209 ),
    .O(\clock/Mcount_count1_cy [12])
  );
  XORCY   \clock/Mcount_count1_xor<11>  (
    .CI(\clock/Mcount_count1_cy [10]),
    .LI(\clock/Mcount_count1_cy<11>_rt_207 ),
    .O(\clock/Result<11>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<11>  (
    .CI(\clock/Mcount_count1_cy [10]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<11>_rt_207 ),
    .O(\clock/Mcount_count1_cy [11])
  );
  XORCY   \clock/Mcount_count1_xor<10>  (
    .CI(\clock/Mcount_count1_cy [9]),
    .LI(\clock/Mcount_count1_cy<10>_rt_205 ),
    .O(\clock/Result<10>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<10>  (
    .CI(\clock/Mcount_count1_cy [9]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<10>_rt_205 ),
    .O(\clock/Mcount_count1_cy [10])
  );
  XORCY   \clock/Mcount_count1_xor<9>  (
    .CI(\clock/Mcount_count1_cy [8]),
    .LI(\clock/Mcount_count1_cy<9>_rt_263 ),
    .O(\clock/Result<9>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<9>  (
    .CI(\clock/Mcount_count1_cy [8]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<9>_rt_263 ),
    .O(\clock/Mcount_count1_cy [9])
  );
  XORCY   \clock/Mcount_count1_xor<8>  (
    .CI(\clock/Mcount_count1_cy [7]),
    .LI(\clock/Mcount_count1_cy<8>_rt_261 ),
    .O(\clock/Result<8>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<8>  (
    .CI(\clock/Mcount_count1_cy [7]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<8>_rt_261 ),
    .O(\clock/Mcount_count1_cy [8])
  );
  XORCY   \clock/Mcount_count1_xor<7>  (
    .CI(\clock/Mcount_count1_cy [6]),
    .LI(\clock/Mcount_count1_cy<7>_rt_259 ),
    .O(\clock/Result<7>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<7>  (
    .CI(\clock/Mcount_count1_cy [6]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<7>_rt_259 ),
    .O(\clock/Mcount_count1_cy [7])
  );
  XORCY   \clock/Mcount_count1_xor<6>  (
    .CI(\clock/Mcount_count1_cy [5]),
    .LI(\clock/Mcount_count1_cy<6>_rt_257 ),
    .O(\clock/Result<6>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<6>  (
    .CI(\clock/Mcount_count1_cy [5]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<6>_rt_257 ),
    .O(\clock/Mcount_count1_cy [6])
  );
  XORCY   \clock/Mcount_count1_xor<5>  (
    .CI(\clock/Mcount_count1_cy [4]),
    .LI(\clock/Mcount_count1_cy<5>_rt_255 ),
    .O(\clock/Result<5>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<5>  (
    .CI(\clock/Mcount_count1_cy [4]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<5>_rt_255 ),
    .O(\clock/Mcount_count1_cy [5])
  );
  XORCY   \clock/Mcount_count1_xor<4>  (
    .CI(\clock/Mcount_count1_cy [3]),
    .LI(\clock/Mcount_count1_cy<4>_rt_253 ),
    .O(\clock/Result<4>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<4>  (
    .CI(\clock/Mcount_count1_cy [3]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<4>_rt_253 ),
    .O(\clock/Mcount_count1_cy [4])
  );
  XORCY   \clock/Mcount_count1_xor<3>  (
    .CI(\clock/Mcount_count1_cy [2]),
    .LI(\clock/Mcount_count1_cy<3>_rt_251 ),
    .O(\clock/Result<3>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<3>  (
    .CI(\clock/Mcount_count1_cy [2]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<3>_rt_251 ),
    .O(\clock/Mcount_count1_cy [3])
  );
  XORCY   \clock/Mcount_count1_xor<2>  (
    .CI(\clock/Mcount_count1_cy [1]),
    .LI(\clock/Mcount_count1_cy<2>_rt_247 ),
    .O(\clock/Result<2>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<2>  (
    .CI(\clock/Mcount_count1_cy [1]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<2>_rt_247 ),
    .O(\clock/Mcount_count1_cy [2])
  );
  XORCY   \clock/Mcount_count1_xor<1>  (
    .CI(\clock/Mcount_count1_cy [0]),
    .LI(\clock/Mcount_count1_cy<1>_rt_225 ),
    .O(\clock/Result<1>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<1>  (
    .CI(\clock/Mcount_count1_cy [0]),
    .DI(N0),
    .S(\clock/Mcount_count1_cy<1>_rt_225 ),
    .O(\clock/Mcount_count1_cy [1])
  );
  XORCY   \clock/Mcount_count1_xor<0>  (
    .CI(N0),
    .LI(\clock/Mcount_count1_lut [0]),
    .O(\clock/Result<0>1 )
  );
  MUXCY   \clock/Mcount_count1_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(\clock/Mcount_count1_lut [0]),
    .O(\clock/Mcount_count1_cy [0])
  );
  XORCY   \clock/Mcount_count0_xor<31>  (
    .CI(\clock/Mcount_count0_cy [30]),
    .LI(\clock/Mcount_count0_xor<31>_rt_202 ),
    .O(\clock/Result [31])
  );
  XORCY   \clock/Mcount_count0_xor<30>  (
    .CI(\clock/Mcount_count0_cy [29]),
    .LI(\clock/Mcount_count0_cy<30>_rt_186 ),
    .O(\clock/Result [30])
  );
  MUXCY   \clock/Mcount_count0_cy<30>  (
    .CI(\clock/Mcount_count0_cy [29]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<30>_rt_186 ),
    .O(\clock/Mcount_count0_cy [30])
  );
  XORCY   \clock/Mcount_count0_xor<29>  (
    .CI(\clock/Mcount_count0_cy [28]),
    .LI(\clock/Mcount_count0_cy<29>_rt_182 ),
    .O(\clock/Result [29])
  );
  MUXCY   \clock/Mcount_count0_cy<29>  (
    .CI(\clock/Mcount_count0_cy [28]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<29>_rt_182 ),
    .O(\clock/Mcount_count0_cy [29])
  );
  XORCY   \clock/Mcount_count0_xor<28>  (
    .CI(\clock/Mcount_count0_cy [27]),
    .LI(\clock/Mcount_count0_cy<28>_rt_180 ),
    .O(\clock/Result [28])
  );
  MUXCY   \clock/Mcount_count0_cy<28>  (
    .CI(\clock/Mcount_count0_cy [27]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<28>_rt_180 ),
    .O(\clock/Mcount_count0_cy [28])
  );
  XORCY   \clock/Mcount_count0_xor<27>  (
    .CI(\clock/Mcount_count0_cy [26]),
    .LI(\clock/Mcount_count0_cy<27>_rt_178 ),
    .O(\clock/Result [27])
  );
  MUXCY   \clock/Mcount_count0_cy<27>  (
    .CI(\clock/Mcount_count0_cy [26]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<27>_rt_178 ),
    .O(\clock/Mcount_count0_cy [27])
  );
  XORCY   \clock/Mcount_count0_xor<26>  (
    .CI(\clock/Mcount_count0_cy [25]),
    .LI(\clock/Mcount_count0_cy<26>_rt_176 ),
    .O(\clock/Result [26])
  );
  MUXCY   \clock/Mcount_count0_cy<26>  (
    .CI(\clock/Mcount_count0_cy [25]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<26>_rt_176 ),
    .O(\clock/Mcount_count0_cy [26])
  );
  XORCY   \clock/Mcount_count0_xor<25>  (
    .CI(\clock/Mcount_count0_cy [24]),
    .LI(\clock/Mcount_count0_cy<25>_rt_174 ),
    .O(\clock/Result [25])
  );
  MUXCY   \clock/Mcount_count0_cy<25>  (
    .CI(\clock/Mcount_count0_cy [24]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<25>_rt_174 ),
    .O(\clock/Mcount_count0_cy [25])
  );
  XORCY   \clock/Mcount_count0_xor<24>  (
    .CI(\clock/Mcount_count0_cy [23]),
    .LI(\clock/Mcount_count0_cy<24>_rt_172 ),
    .O(\clock/Result [24])
  );
  MUXCY   \clock/Mcount_count0_cy<24>  (
    .CI(\clock/Mcount_count0_cy [23]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<24>_rt_172 ),
    .O(\clock/Mcount_count0_cy [24])
  );
  XORCY   \clock/Mcount_count0_xor<23>  (
    .CI(\clock/Mcount_count0_cy [22]),
    .LI(\clock/Mcount_count0_cy<23>_rt_170 ),
    .O(\clock/Result [23])
  );
  MUXCY   \clock/Mcount_count0_cy<23>  (
    .CI(\clock/Mcount_count0_cy [22]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<23>_rt_170 ),
    .O(\clock/Mcount_count0_cy [23])
  );
  XORCY   \clock/Mcount_count0_xor<22>  (
    .CI(\clock/Mcount_count0_cy [21]),
    .LI(\clock/Mcount_count0_cy<22>_rt_168 ),
    .O(\clock/Result [22])
  );
  MUXCY   \clock/Mcount_count0_cy<22>  (
    .CI(\clock/Mcount_count0_cy [21]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<22>_rt_168 ),
    .O(\clock/Mcount_count0_cy [22])
  );
  XORCY   \clock/Mcount_count0_xor<21>  (
    .CI(\clock/Mcount_count0_cy [20]),
    .LI(\clock/Mcount_count0_cy<21>_rt_166 ),
    .O(\clock/Result [21])
  );
  MUXCY   \clock/Mcount_count0_cy<21>  (
    .CI(\clock/Mcount_count0_cy [20]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<21>_rt_166 ),
    .O(\clock/Mcount_count0_cy [21])
  );
  XORCY   \clock/Mcount_count0_xor<20>  (
    .CI(\clock/Mcount_count0_cy [19]),
    .LI(\clock/Mcount_count0_cy<20>_rt_164 ),
    .O(\clock/Result [20])
  );
  MUXCY   \clock/Mcount_count0_cy<20>  (
    .CI(\clock/Mcount_count0_cy [19]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<20>_rt_164 ),
    .O(\clock/Mcount_count0_cy [20])
  );
  XORCY   \clock/Mcount_count0_xor<19>  (
    .CI(\clock/Mcount_count0_cy [18]),
    .LI(\clock/Mcount_count0_cy<19>_rt_160 ),
    .O(\clock/Result [19])
  );
  MUXCY   \clock/Mcount_count0_cy<19>  (
    .CI(\clock/Mcount_count0_cy [18]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<19>_rt_160 ),
    .O(\clock/Mcount_count0_cy [19])
  );
  XORCY   \clock/Mcount_count0_xor<18>  (
    .CI(\clock/Mcount_count0_cy [17]),
    .LI(\clock/Mcount_count0_cy<18>_rt_158 ),
    .O(\clock/Result [18])
  );
  MUXCY   \clock/Mcount_count0_cy<18>  (
    .CI(\clock/Mcount_count0_cy [17]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<18>_rt_158 ),
    .O(\clock/Mcount_count0_cy [18])
  );
  XORCY   \clock/Mcount_count0_xor<17>  (
    .CI(\clock/Mcount_count0_cy [16]),
    .LI(\clock/Mcount_count0_cy<17>_rt_156 ),
    .O(\clock/Result [17])
  );
  MUXCY   \clock/Mcount_count0_cy<17>  (
    .CI(\clock/Mcount_count0_cy [16]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<17>_rt_156 ),
    .O(\clock/Mcount_count0_cy [17])
  );
  XORCY   \clock/Mcount_count0_xor<16>  (
    .CI(\clock/Mcount_count0_cy [15]),
    .LI(\clock/Mcount_count0_cy<16>_rt_154 ),
    .O(\clock/Result [16])
  );
  MUXCY   \clock/Mcount_count0_cy<16>  (
    .CI(\clock/Mcount_count0_cy [15]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<16>_rt_154 ),
    .O(\clock/Mcount_count0_cy [16])
  );
  XORCY   \clock/Mcount_count0_xor<15>  (
    .CI(\clock/Mcount_count0_cy [14]),
    .LI(\clock/Mcount_count0_cy<15>_rt_152 ),
    .O(\clock/Result [15])
  );
  MUXCY   \clock/Mcount_count0_cy<15>  (
    .CI(\clock/Mcount_count0_cy [14]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<15>_rt_152 ),
    .O(\clock/Mcount_count0_cy [15])
  );
  XORCY   \clock/Mcount_count0_xor<14>  (
    .CI(\clock/Mcount_count0_cy [13]),
    .LI(\clock/Mcount_count0_cy<14>_rt_150 ),
    .O(\clock/Result [14])
  );
  MUXCY   \clock/Mcount_count0_cy<14>  (
    .CI(\clock/Mcount_count0_cy [13]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<14>_rt_150 ),
    .O(\clock/Mcount_count0_cy [14])
  );
  XORCY   \clock/Mcount_count0_xor<13>  (
    .CI(\clock/Mcount_count0_cy [12]),
    .LI(\clock/Mcount_count0_cy<13>_rt_148 ),
    .O(\clock/Result [13])
  );
  MUXCY   \clock/Mcount_count0_cy<13>  (
    .CI(\clock/Mcount_count0_cy [12]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<13>_rt_148 ),
    .O(\clock/Mcount_count0_cy [13])
  );
  XORCY   \clock/Mcount_count0_xor<12>  (
    .CI(\clock/Mcount_count0_cy [11]),
    .LI(\clock/Mcount_count0_cy<12>_rt_146 ),
    .O(\clock/Result [12])
  );
  MUXCY   \clock/Mcount_count0_cy<12>  (
    .CI(\clock/Mcount_count0_cy [11]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<12>_rt_146 ),
    .O(\clock/Mcount_count0_cy [12])
  );
  XORCY   \clock/Mcount_count0_xor<11>  (
    .CI(\clock/Mcount_count0_cy [10]),
    .LI(\clock/Mcount_count0_cy<11>_rt_144 ),
    .O(\clock/Result [11])
  );
  MUXCY   \clock/Mcount_count0_cy<11>  (
    .CI(\clock/Mcount_count0_cy [10]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<11>_rt_144 ),
    .O(\clock/Mcount_count0_cy [11])
  );
  XORCY   \clock/Mcount_count0_xor<10>  (
    .CI(\clock/Mcount_count0_cy [9]),
    .LI(\clock/Mcount_count0_cy<10>_rt_142 ),
    .O(\clock/Result [10])
  );
  MUXCY   \clock/Mcount_count0_cy<10>  (
    .CI(\clock/Mcount_count0_cy [9]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<10>_rt_142 ),
    .O(\clock/Mcount_count0_cy [10])
  );
  XORCY   \clock/Mcount_count0_xor<9>  (
    .CI(\clock/Mcount_count0_cy [8]),
    .LI(\clock/Mcount_count0_cy<9>_rt_200 ),
    .O(\clock/Result [9])
  );
  MUXCY   \clock/Mcount_count0_cy<9>  (
    .CI(\clock/Mcount_count0_cy [8]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<9>_rt_200 ),
    .O(\clock/Mcount_count0_cy [9])
  );
  XORCY   \clock/Mcount_count0_xor<8>  (
    .CI(\clock/Mcount_count0_cy [7]),
    .LI(\clock/Mcount_count0_cy<8>_rt_198 ),
    .O(\clock/Result [8])
  );
  MUXCY   \clock/Mcount_count0_cy<8>  (
    .CI(\clock/Mcount_count0_cy [7]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<8>_rt_198 ),
    .O(\clock/Mcount_count0_cy [8])
  );
  XORCY   \clock/Mcount_count0_xor<7>  (
    .CI(\clock/Mcount_count0_cy [6]),
    .LI(\clock/Mcount_count0_cy<7>_rt_196 ),
    .O(\clock/Result [7])
  );
  MUXCY   \clock/Mcount_count0_cy<7>  (
    .CI(\clock/Mcount_count0_cy [6]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<7>_rt_196 ),
    .O(\clock/Mcount_count0_cy [7])
  );
  XORCY   \clock/Mcount_count0_xor<6>  (
    .CI(\clock/Mcount_count0_cy [5]),
    .LI(\clock/Mcount_count0_cy<6>_rt_194 ),
    .O(\clock/Result [6])
  );
  MUXCY   \clock/Mcount_count0_cy<6>  (
    .CI(\clock/Mcount_count0_cy [5]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<6>_rt_194 ),
    .O(\clock/Mcount_count0_cy [6])
  );
  XORCY   \clock/Mcount_count0_xor<5>  (
    .CI(\clock/Mcount_count0_cy [4]),
    .LI(\clock/Mcount_count0_cy<5>_rt_192 ),
    .O(\clock/Result [5])
  );
  MUXCY   \clock/Mcount_count0_cy<5>  (
    .CI(\clock/Mcount_count0_cy [4]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<5>_rt_192 ),
    .O(\clock/Mcount_count0_cy [5])
  );
  XORCY   \clock/Mcount_count0_xor<4>  (
    .CI(\clock/Mcount_count0_cy [3]),
    .LI(\clock/Mcount_count0_cy<4>_rt_190 ),
    .O(\clock/Result [4])
  );
  MUXCY   \clock/Mcount_count0_cy<4>  (
    .CI(\clock/Mcount_count0_cy [3]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<4>_rt_190 ),
    .O(\clock/Mcount_count0_cy [4])
  );
  XORCY   \clock/Mcount_count0_xor<3>  (
    .CI(\clock/Mcount_count0_cy [2]),
    .LI(\clock/Mcount_count0_cy<3>_rt_188 ),
    .O(\clock/Result [3])
  );
  MUXCY   \clock/Mcount_count0_cy<3>  (
    .CI(\clock/Mcount_count0_cy [2]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<3>_rt_188 ),
    .O(\clock/Mcount_count0_cy [3])
  );
  XORCY   \clock/Mcount_count0_xor<2>  (
    .CI(\clock/Mcount_count0_cy [1]),
    .LI(\clock/Mcount_count0_cy<2>_rt_184 ),
    .O(\clock/Result [2])
  );
  MUXCY   \clock/Mcount_count0_cy<2>  (
    .CI(\clock/Mcount_count0_cy [1]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<2>_rt_184 ),
    .O(\clock/Mcount_count0_cy [2])
  );
  XORCY   \clock/Mcount_count0_xor<1>  (
    .CI(\clock/Mcount_count0_cy [0]),
    .LI(\clock/Mcount_count0_cy<1>_rt_162 ),
    .O(\clock/Result [1])
  );
  MUXCY   \clock/Mcount_count0_cy<1>  (
    .CI(\clock/Mcount_count0_cy [0]),
    .DI(N0),
    .S(\clock/Mcount_count0_cy<1>_rt_162 ),
    .O(\clock/Mcount_count0_cy [1])
  );
  XORCY   \clock/Mcount_count0_xor<0>  (
    .CI(N0),
    .LI(\clock/Mcount_count0_lut [0]),
    .O(\clock/Result [0])
  );
  MUXCY   \clock/Mcount_count0_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(\clock/Mcount_count0_lut [0]),
    .O(\clock/Mcount_count0_cy [0])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<31>  (
    .CI(\clock/Madd_count3_addsub0000_cy [30]),
    .LI(\clock/Madd_count3_addsub0000_xor<31>_rt_139 ),
    .O(\clock/count3_addsub0000 [31])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<30>  (
    .CI(\clock/Madd_count3_addsub0000_cy [29]),
    .LI(\clock/Madd_count3_addsub0000_cy<30>_rt_123 ),
    .O(\clock/count3_addsub0000 [30])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<30>  (
    .CI(\clock/Madd_count3_addsub0000_cy [29]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<30>_rt_123 ),
    .O(\clock/Madd_count3_addsub0000_cy [30])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<29>  (
    .CI(\clock/Madd_count3_addsub0000_cy [28]),
    .LI(\clock/Madd_count3_addsub0000_cy<29>_rt_119 ),
    .O(\clock/count3_addsub0000 [29])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<29>  (
    .CI(\clock/Madd_count3_addsub0000_cy [28]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<29>_rt_119 ),
    .O(\clock/Madd_count3_addsub0000_cy [29])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<28>  (
    .CI(\clock/Madd_count3_addsub0000_cy [27]),
    .LI(\clock/Madd_count3_addsub0000_cy<28>_rt_117 ),
    .O(\clock/count3_addsub0000 [28])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<28>  (
    .CI(\clock/Madd_count3_addsub0000_cy [27]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<28>_rt_117 ),
    .O(\clock/Madd_count3_addsub0000_cy [28])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<27>  (
    .CI(\clock/Madd_count3_addsub0000_cy [26]),
    .LI(\clock/Madd_count3_addsub0000_cy<27>_rt_115 ),
    .O(\clock/count3_addsub0000 [27])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<27>  (
    .CI(\clock/Madd_count3_addsub0000_cy [26]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<27>_rt_115 ),
    .O(\clock/Madd_count3_addsub0000_cy [27])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<26>  (
    .CI(\clock/Madd_count3_addsub0000_cy [25]),
    .LI(\clock/Madd_count3_addsub0000_cy<26>_rt_113 ),
    .O(\clock/count3_addsub0000 [26])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<26>  (
    .CI(\clock/Madd_count3_addsub0000_cy [25]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<26>_rt_113 ),
    .O(\clock/Madd_count3_addsub0000_cy [26])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<25>  (
    .CI(\clock/Madd_count3_addsub0000_cy [24]),
    .LI(\clock/Madd_count3_addsub0000_cy<25>_rt_111 ),
    .O(\clock/count3_addsub0000 [25])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<25>  (
    .CI(\clock/Madd_count3_addsub0000_cy [24]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<25>_rt_111 ),
    .O(\clock/Madd_count3_addsub0000_cy [25])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<24>  (
    .CI(\clock/Madd_count3_addsub0000_cy [23]),
    .LI(\clock/Madd_count3_addsub0000_cy<24>_rt_109 ),
    .O(\clock/count3_addsub0000 [24])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<24>  (
    .CI(\clock/Madd_count3_addsub0000_cy [23]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<24>_rt_109 ),
    .O(\clock/Madd_count3_addsub0000_cy [24])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<23>  (
    .CI(\clock/Madd_count3_addsub0000_cy [22]),
    .LI(\clock/Madd_count3_addsub0000_cy<23>_rt_107 ),
    .O(\clock/count3_addsub0000 [23])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<23>  (
    .CI(\clock/Madd_count3_addsub0000_cy [22]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<23>_rt_107 ),
    .O(\clock/Madd_count3_addsub0000_cy [23])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<22>  (
    .CI(\clock/Madd_count3_addsub0000_cy [21]),
    .LI(\clock/Madd_count3_addsub0000_cy<22>_rt_105 ),
    .O(\clock/count3_addsub0000 [22])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<22>  (
    .CI(\clock/Madd_count3_addsub0000_cy [21]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<22>_rt_105 ),
    .O(\clock/Madd_count3_addsub0000_cy [22])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<21>  (
    .CI(\clock/Madd_count3_addsub0000_cy [20]),
    .LI(\clock/Madd_count3_addsub0000_cy<21>_rt_103 ),
    .O(\clock/count3_addsub0000 [21])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<21>  (
    .CI(\clock/Madd_count3_addsub0000_cy [20]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<21>_rt_103 ),
    .O(\clock/Madd_count3_addsub0000_cy [21])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<20>  (
    .CI(\clock/Madd_count3_addsub0000_cy [19]),
    .LI(\clock/Madd_count3_addsub0000_cy<20>_rt_101 ),
    .O(\clock/count3_addsub0000 [20])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<20>  (
    .CI(\clock/Madd_count3_addsub0000_cy [19]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<20>_rt_101 ),
    .O(\clock/Madd_count3_addsub0000_cy [20])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<19>  (
    .CI(\clock/Madd_count3_addsub0000_cy [18]),
    .LI(\clock/Madd_count3_addsub0000_cy<19>_rt_97 ),
    .O(\clock/count3_addsub0000 [19])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<19>  (
    .CI(\clock/Madd_count3_addsub0000_cy [18]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<19>_rt_97 ),
    .O(\clock/Madd_count3_addsub0000_cy [19])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<18>  (
    .CI(\clock/Madd_count3_addsub0000_cy [17]),
    .LI(\clock/Madd_count3_addsub0000_cy<18>_rt_95 ),
    .O(\clock/count3_addsub0000 [18])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<18>  (
    .CI(\clock/Madd_count3_addsub0000_cy [17]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<18>_rt_95 ),
    .O(\clock/Madd_count3_addsub0000_cy [18])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<17>  (
    .CI(\clock/Madd_count3_addsub0000_cy [16]),
    .LI(\clock/Madd_count3_addsub0000_cy<17>_rt_93 ),
    .O(\clock/count3_addsub0000 [17])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<17>  (
    .CI(\clock/Madd_count3_addsub0000_cy [16]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<17>_rt_93 ),
    .O(\clock/Madd_count3_addsub0000_cy [17])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<16>  (
    .CI(\clock/Madd_count3_addsub0000_cy [15]),
    .LI(\clock/Madd_count3_addsub0000_cy<16>_rt_91 ),
    .O(\clock/count3_addsub0000 [16])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<16>  (
    .CI(\clock/Madd_count3_addsub0000_cy [15]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<16>_rt_91 ),
    .O(\clock/Madd_count3_addsub0000_cy [16])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<15>  (
    .CI(\clock/Madd_count3_addsub0000_cy [14]),
    .LI(\clock/Madd_count3_addsub0000_cy<15>_rt_89 ),
    .O(\clock/count3_addsub0000 [15])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<15>  (
    .CI(\clock/Madd_count3_addsub0000_cy [14]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<15>_rt_89 ),
    .O(\clock/Madd_count3_addsub0000_cy [15])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<14>  (
    .CI(\clock/Madd_count3_addsub0000_cy [13]),
    .LI(\clock/Madd_count3_addsub0000_cy<14>_rt_87 ),
    .O(\clock/count3_addsub0000 [14])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<14>  (
    .CI(\clock/Madd_count3_addsub0000_cy [13]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<14>_rt_87 ),
    .O(\clock/Madd_count3_addsub0000_cy [14])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<13>  (
    .CI(\clock/Madd_count3_addsub0000_cy [12]),
    .LI(\clock/Madd_count3_addsub0000_cy<13>_rt_85 ),
    .O(\clock/count3_addsub0000 [13])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<13>  (
    .CI(\clock/Madd_count3_addsub0000_cy [12]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<13>_rt_85 ),
    .O(\clock/Madd_count3_addsub0000_cy [13])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<12>  (
    .CI(\clock/Madd_count3_addsub0000_cy [11]),
    .LI(\clock/Madd_count3_addsub0000_cy<12>_rt_83 ),
    .O(\clock/count3_addsub0000 [12])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<12>  (
    .CI(\clock/Madd_count3_addsub0000_cy [11]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<12>_rt_83 ),
    .O(\clock/Madd_count3_addsub0000_cy [12])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<11>  (
    .CI(\clock/Madd_count3_addsub0000_cy [10]),
    .LI(\clock/Madd_count3_addsub0000_cy<11>_rt_81 ),
    .O(\clock/count3_addsub0000 [11])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<11>  (
    .CI(\clock/Madd_count3_addsub0000_cy [10]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<11>_rt_81 ),
    .O(\clock/Madd_count3_addsub0000_cy [11])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<10>  (
    .CI(\clock/Madd_count3_addsub0000_cy [9]),
    .LI(\clock/Madd_count3_addsub0000_cy<10>_rt_79 ),
    .O(\clock/count3_addsub0000 [10])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<10>  (
    .CI(\clock/Madd_count3_addsub0000_cy [9]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<10>_rt_79 ),
    .O(\clock/Madd_count3_addsub0000_cy [10])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<9>  (
    .CI(\clock/Madd_count3_addsub0000_cy [8]),
    .LI(\clock/Madd_count3_addsub0000_cy<9>_rt_137 ),
    .O(\clock/count3_addsub0000 [9])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<9>  (
    .CI(\clock/Madd_count3_addsub0000_cy [8]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<9>_rt_137 ),
    .O(\clock/Madd_count3_addsub0000_cy [9])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<8>  (
    .CI(\clock/Madd_count3_addsub0000_cy [7]),
    .LI(\clock/Madd_count3_addsub0000_cy<8>_rt_135 ),
    .O(\clock/count3_addsub0000 [8])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<8>  (
    .CI(\clock/Madd_count3_addsub0000_cy [7]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<8>_rt_135 ),
    .O(\clock/Madd_count3_addsub0000_cy [8])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<7>  (
    .CI(\clock/Madd_count3_addsub0000_cy [6]),
    .LI(\clock/Madd_count3_addsub0000_cy<7>_rt_133 ),
    .O(\clock/count3_addsub0000 [7])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<7>  (
    .CI(\clock/Madd_count3_addsub0000_cy [6]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<7>_rt_133 ),
    .O(\clock/Madd_count3_addsub0000_cy [7])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<6>  (
    .CI(\clock/Madd_count3_addsub0000_cy [5]),
    .LI(\clock/Madd_count3_addsub0000_cy<6>_rt_131 ),
    .O(\clock/count3_addsub0000 [6])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<6>  (
    .CI(\clock/Madd_count3_addsub0000_cy [5]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<6>_rt_131 ),
    .O(\clock/Madd_count3_addsub0000_cy [6])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<5>  (
    .CI(\clock/Madd_count3_addsub0000_cy [4]),
    .LI(\clock/Madd_count3_addsub0000_cy<5>_rt_129 ),
    .O(\clock/count3_addsub0000 [5])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<5>  (
    .CI(\clock/Madd_count3_addsub0000_cy [4]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<5>_rt_129 ),
    .O(\clock/Madd_count3_addsub0000_cy [5])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<4>  (
    .CI(\clock/Madd_count3_addsub0000_cy [3]),
    .LI(\clock/Madd_count3_addsub0000_cy<4>_rt_127 ),
    .O(\clock/count3_addsub0000 [4])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<4>  (
    .CI(\clock/Madd_count3_addsub0000_cy [3]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<4>_rt_127 ),
    .O(\clock/Madd_count3_addsub0000_cy [4])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<3>  (
    .CI(\clock/Madd_count3_addsub0000_cy [2]),
    .LI(\clock/Madd_count3_addsub0000_cy<3>_rt_125 ),
    .O(\clock/count3_addsub0000 [3])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<3>  (
    .CI(\clock/Madd_count3_addsub0000_cy [2]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<3>_rt_125 ),
    .O(\clock/Madd_count3_addsub0000_cy [3])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<2>  (
    .CI(\clock/Madd_count3_addsub0000_cy [1]),
    .LI(\clock/Madd_count3_addsub0000_cy<2>_rt_121 ),
    .O(\clock/count3_addsub0000 [2])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<2>  (
    .CI(\clock/Madd_count3_addsub0000_cy [1]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<2>_rt_121 ),
    .O(\clock/Madd_count3_addsub0000_cy [2])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<1>  (
    .CI(\clock/Madd_count3_addsub0000_cy [0]),
    .LI(\clock/Madd_count3_addsub0000_cy<1>_rt_99 ),
    .O(\clock/count3_addsub0000 [1])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<1>  (
    .CI(\clock/Madd_count3_addsub0000_cy [0]),
    .DI(N0),
    .S(\clock/Madd_count3_addsub0000_cy<1>_rt_99 ),
    .O(\clock/Madd_count3_addsub0000_cy [1])
  );
  XORCY   \clock/Madd_count3_addsub0000_xor<0>  (
    .CI(N0),
    .LI(\clock/Madd_count3_addsub0000_lut [0]),
    .O(\clock/count3_addsub0000 [0])
  );
  MUXCY   \clock/Madd_count3_addsub0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(\clock/Madd_count3_addsub0000_lut [0]),
    .O(\clock/Madd_count3_addsub0000_cy [0])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<31>  (
    .CI(\clock/Madd_count2_addsub0000_cy [30]),
    .LI(\clock/Madd_count2_addsub0000_xor<31>_rt_76 ),
    .O(\clock/count2_addsub0000 [31])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<30>  (
    .CI(\clock/Madd_count2_addsub0000_cy [29]),
    .LI(\clock/Madd_count2_addsub0000_cy<30>_rt_60 ),
    .O(\clock/count2_addsub0000 [30])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<30>  (
    .CI(\clock/Madd_count2_addsub0000_cy [29]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<30>_rt_60 ),
    .O(\clock/Madd_count2_addsub0000_cy [30])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<29>  (
    .CI(\clock/Madd_count2_addsub0000_cy [28]),
    .LI(\clock/Madd_count2_addsub0000_cy<29>_rt_56 ),
    .O(\clock/count2_addsub0000 [29])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<29>  (
    .CI(\clock/Madd_count2_addsub0000_cy [28]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<29>_rt_56 ),
    .O(\clock/Madd_count2_addsub0000_cy [29])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<28>  (
    .CI(\clock/Madd_count2_addsub0000_cy [27]),
    .LI(\clock/Madd_count2_addsub0000_cy<28>_rt_54 ),
    .O(\clock/count2_addsub0000 [28])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<28>  (
    .CI(\clock/Madd_count2_addsub0000_cy [27]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<28>_rt_54 ),
    .O(\clock/Madd_count2_addsub0000_cy [28])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<27>  (
    .CI(\clock/Madd_count2_addsub0000_cy [26]),
    .LI(\clock/Madd_count2_addsub0000_cy<27>_rt_52 ),
    .O(\clock/count2_addsub0000 [27])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<27>  (
    .CI(\clock/Madd_count2_addsub0000_cy [26]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<27>_rt_52 ),
    .O(\clock/Madd_count2_addsub0000_cy [27])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<26>  (
    .CI(\clock/Madd_count2_addsub0000_cy [25]),
    .LI(\clock/Madd_count2_addsub0000_cy<26>_rt_50 ),
    .O(\clock/count2_addsub0000 [26])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<26>  (
    .CI(\clock/Madd_count2_addsub0000_cy [25]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<26>_rt_50 ),
    .O(\clock/Madd_count2_addsub0000_cy [26])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<25>  (
    .CI(\clock/Madd_count2_addsub0000_cy [24]),
    .LI(\clock/Madd_count2_addsub0000_cy<25>_rt_48 ),
    .O(\clock/count2_addsub0000 [25])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<25>  (
    .CI(\clock/Madd_count2_addsub0000_cy [24]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<25>_rt_48 ),
    .O(\clock/Madd_count2_addsub0000_cy [25])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<24>  (
    .CI(\clock/Madd_count2_addsub0000_cy [23]),
    .LI(\clock/Madd_count2_addsub0000_cy<24>_rt_46 ),
    .O(\clock/count2_addsub0000 [24])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<24>  (
    .CI(\clock/Madd_count2_addsub0000_cy [23]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<24>_rt_46 ),
    .O(\clock/Madd_count2_addsub0000_cy [24])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<23>  (
    .CI(\clock/Madd_count2_addsub0000_cy [22]),
    .LI(\clock/Madd_count2_addsub0000_cy<23>_rt_44 ),
    .O(\clock/count2_addsub0000 [23])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<23>  (
    .CI(\clock/Madd_count2_addsub0000_cy [22]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<23>_rt_44 ),
    .O(\clock/Madd_count2_addsub0000_cy [23])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<22>  (
    .CI(\clock/Madd_count2_addsub0000_cy [21]),
    .LI(\clock/Madd_count2_addsub0000_cy<22>_rt_42 ),
    .O(\clock/count2_addsub0000 [22])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<22>  (
    .CI(\clock/Madd_count2_addsub0000_cy [21]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<22>_rt_42 ),
    .O(\clock/Madd_count2_addsub0000_cy [22])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<21>  (
    .CI(\clock/Madd_count2_addsub0000_cy [20]),
    .LI(\clock/Madd_count2_addsub0000_cy<21>_rt_40 ),
    .O(\clock/count2_addsub0000 [21])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<21>  (
    .CI(\clock/Madd_count2_addsub0000_cy [20]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<21>_rt_40 ),
    .O(\clock/Madd_count2_addsub0000_cy [21])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<20>  (
    .CI(\clock/Madd_count2_addsub0000_cy [19]),
    .LI(\clock/Madd_count2_addsub0000_cy<20>_rt_38 ),
    .O(\clock/count2_addsub0000 [20])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<20>  (
    .CI(\clock/Madd_count2_addsub0000_cy [19]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<20>_rt_38 ),
    .O(\clock/Madd_count2_addsub0000_cy [20])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<19>  (
    .CI(\clock/Madd_count2_addsub0000_cy [18]),
    .LI(\clock/Madd_count2_addsub0000_cy<19>_rt_34 ),
    .O(\clock/count2_addsub0000 [19])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<19>  (
    .CI(\clock/Madd_count2_addsub0000_cy [18]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<19>_rt_34 ),
    .O(\clock/Madd_count2_addsub0000_cy [19])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<18>  (
    .CI(\clock/Madd_count2_addsub0000_cy [17]),
    .LI(\clock/Madd_count2_addsub0000_cy<18>_rt_32 ),
    .O(\clock/count2_addsub0000 [18])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<18>  (
    .CI(\clock/Madd_count2_addsub0000_cy [17]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<18>_rt_32 ),
    .O(\clock/Madd_count2_addsub0000_cy [18])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<17>  (
    .CI(\clock/Madd_count2_addsub0000_cy [16]),
    .LI(\clock/Madd_count2_addsub0000_cy<17>_rt_30 ),
    .O(\clock/count2_addsub0000 [17])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<17>  (
    .CI(\clock/Madd_count2_addsub0000_cy [16]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<17>_rt_30 ),
    .O(\clock/Madd_count2_addsub0000_cy [17])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<16>  (
    .CI(\clock/Madd_count2_addsub0000_cy [15]),
    .LI(\clock/Madd_count2_addsub0000_cy<16>_rt_28 ),
    .O(\clock/count2_addsub0000 [16])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<16>  (
    .CI(\clock/Madd_count2_addsub0000_cy [15]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<16>_rt_28 ),
    .O(\clock/Madd_count2_addsub0000_cy [16])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<15>  (
    .CI(\clock/Madd_count2_addsub0000_cy [14]),
    .LI(\clock/Madd_count2_addsub0000_cy<15>_rt_26 ),
    .O(\clock/count2_addsub0000 [15])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<15>  (
    .CI(\clock/Madd_count2_addsub0000_cy [14]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<15>_rt_26 ),
    .O(\clock/Madd_count2_addsub0000_cy [15])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<14>  (
    .CI(\clock/Madd_count2_addsub0000_cy [13]),
    .LI(\clock/Madd_count2_addsub0000_cy<14>_rt_24 ),
    .O(\clock/count2_addsub0000 [14])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<14>  (
    .CI(\clock/Madd_count2_addsub0000_cy [13]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<14>_rt_24 ),
    .O(\clock/Madd_count2_addsub0000_cy [14])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<13>  (
    .CI(\clock/Madd_count2_addsub0000_cy [12]),
    .LI(\clock/Madd_count2_addsub0000_cy<13>_rt_22 ),
    .O(\clock/count2_addsub0000 [13])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<13>  (
    .CI(\clock/Madd_count2_addsub0000_cy [12]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<13>_rt_22 ),
    .O(\clock/Madd_count2_addsub0000_cy [13])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<12>  (
    .CI(\clock/Madd_count2_addsub0000_cy [11]),
    .LI(\clock/Madd_count2_addsub0000_cy<12>_rt_20 ),
    .O(\clock/count2_addsub0000 [12])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<12>  (
    .CI(\clock/Madd_count2_addsub0000_cy [11]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<12>_rt_20 ),
    .O(\clock/Madd_count2_addsub0000_cy [12])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<11>  (
    .CI(\clock/Madd_count2_addsub0000_cy [10]),
    .LI(\clock/Madd_count2_addsub0000_cy<11>_rt_18 ),
    .O(\clock/count2_addsub0000 [11])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<11>  (
    .CI(\clock/Madd_count2_addsub0000_cy [10]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<11>_rt_18 ),
    .O(\clock/Madd_count2_addsub0000_cy [11])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<10>  (
    .CI(\clock/Madd_count2_addsub0000_cy [9]),
    .LI(\clock/Madd_count2_addsub0000_cy<10>_rt_16 ),
    .O(\clock/count2_addsub0000 [10])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<10>  (
    .CI(\clock/Madd_count2_addsub0000_cy [9]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<10>_rt_16 ),
    .O(\clock/Madd_count2_addsub0000_cy [10])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<9>  (
    .CI(\clock/Madd_count2_addsub0000_cy [8]),
    .LI(\clock/Madd_count2_addsub0000_cy<9>_rt_74 ),
    .O(\clock/count2_addsub0000 [9])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<9>  (
    .CI(\clock/Madd_count2_addsub0000_cy [8]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<9>_rt_74 ),
    .O(\clock/Madd_count2_addsub0000_cy [9])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<8>  (
    .CI(\clock/Madd_count2_addsub0000_cy [7]),
    .LI(\clock/Madd_count2_addsub0000_cy<8>_rt_72 ),
    .O(\clock/count2_addsub0000 [8])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<8>  (
    .CI(\clock/Madd_count2_addsub0000_cy [7]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<8>_rt_72 ),
    .O(\clock/Madd_count2_addsub0000_cy [8])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<7>  (
    .CI(\clock/Madd_count2_addsub0000_cy [6]),
    .LI(\clock/Madd_count2_addsub0000_cy<7>_rt_70 ),
    .O(\clock/count2_addsub0000 [7])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<7>  (
    .CI(\clock/Madd_count2_addsub0000_cy [6]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<7>_rt_70 ),
    .O(\clock/Madd_count2_addsub0000_cy [7])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<6>  (
    .CI(\clock/Madd_count2_addsub0000_cy [5]),
    .LI(\clock/Madd_count2_addsub0000_cy<6>_rt_68 ),
    .O(\clock/count2_addsub0000 [6])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<6>  (
    .CI(\clock/Madd_count2_addsub0000_cy [5]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<6>_rt_68 ),
    .O(\clock/Madd_count2_addsub0000_cy [6])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<5>  (
    .CI(\clock/Madd_count2_addsub0000_cy [4]),
    .LI(\clock/Madd_count2_addsub0000_cy<5>_rt_66 ),
    .O(\clock/count2_addsub0000 [5])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<5>  (
    .CI(\clock/Madd_count2_addsub0000_cy [4]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<5>_rt_66 ),
    .O(\clock/Madd_count2_addsub0000_cy [5])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<4>  (
    .CI(\clock/Madd_count2_addsub0000_cy [3]),
    .LI(\clock/Madd_count2_addsub0000_cy<4>_rt_64 ),
    .O(\clock/count2_addsub0000 [4])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<4>  (
    .CI(\clock/Madd_count2_addsub0000_cy [3]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<4>_rt_64 ),
    .O(\clock/Madd_count2_addsub0000_cy [4])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<3>  (
    .CI(\clock/Madd_count2_addsub0000_cy [2]),
    .LI(\clock/Madd_count2_addsub0000_cy<3>_rt_62 ),
    .O(\clock/count2_addsub0000 [3])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<3>  (
    .CI(\clock/Madd_count2_addsub0000_cy [2]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<3>_rt_62 ),
    .O(\clock/Madd_count2_addsub0000_cy [3])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<2>  (
    .CI(\clock/Madd_count2_addsub0000_cy [1]),
    .LI(\clock/Madd_count2_addsub0000_cy<2>_rt_58 ),
    .O(\clock/count2_addsub0000 [2])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<2>  (
    .CI(\clock/Madd_count2_addsub0000_cy [1]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<2>_rt_58 ),
    .O(\clock/Madd_count2_addsub0000_cy [2])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<1>  (
    .CI(\clock/Madd_count2_addsub0000_cy [0]),
    .LI(\clock/Madd_count2_addsub0000_cy<1>_rt_36 ),
    .O(\clock/count2_addsub0000 [1])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<1>  (
    .CI(\clock/Madd_count2_addsub0000_cy [0]),
    .DI(N0),
    .S(\clock/Madd_count2_addsub0000_cy<1>_rt_36 ),
    .O(\clock/Madd_count2_addsub0000_cy [1])
  );
  XORCY   \clock/Madd_count2_addsub0000_xor<0>  (
    .CI(N0),
    .LI(\clock/Madd_count2_addsub0000_lut [0]),
    .O(\clock/count2_addsub0000 [0])
  );
  MUXCY   \clock/Madd_count2_addsub0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(\clock/Madd_count2_addsub0000_lut [0]),
    .O(\clock/Madd_count2_addsub0000_cy [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_31  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [31]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [31])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_30  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [30]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [30])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_29  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [29]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [29])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_28  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [28]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [28])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_27  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [27]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [27])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_26  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [26]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [26])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_25  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [25]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [25])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_24  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [24]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [24])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_23  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [23]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [23])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_22  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [22]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [22])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_21  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [21]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [21])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_20  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [20]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [20])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_19  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [19]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [19])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_18  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [18]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [18])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_17  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [17]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [17])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_16  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [16]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [16])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_15  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [15]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_14  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [14]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_13  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [13]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_12  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [12]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_11  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [11]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_10  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [10]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_9  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [9]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_8  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [8]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_7  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [7]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_6  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [6]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_5  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [5]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_4  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [4]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_3  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [3]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_2  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [2]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_1  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [1]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \clock/count0_0  (
    .C(clock_in_BUFGP_657),
    .D(\clock/Result [0]),
    .R(\clock/count0_cmp_eq0000 ),
    .Q(\clock/count0 [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_31  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<31>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [31])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_30  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<30>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [30])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_29  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<29>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [29])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_28  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<28>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [28])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_27  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<27>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [27])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_26  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<26>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [26])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_25  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<25>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [25])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_24  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<24>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [24])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_23  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<23>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [23])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_22  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<22>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [22])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_21  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<21>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [21])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_20  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<20>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [20])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_19  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<19>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [19])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_18  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<18>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [18])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_17  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<17>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_16  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<16>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_15  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<15>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_14  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<14>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_13  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<13>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_12  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<12>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_11  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<11>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_10  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<10>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_9  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<9>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_8  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<8>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_7  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<7>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_6  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<6>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_5  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<5>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_4  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<4>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_3  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<3>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_2  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<2>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_1  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<1>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \clock/count1_0  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count0_cmp_eq0000 ),
    .D(\clock/Result<0>1 ),
    .R(\clock/count1_and0000 ),
    .Q(\clock/count1 [0])
  );
  FD   \clock/cout  (
    .C(clock_in_BUFGP_657),
    .D(\clock/d_653 ),
    .Q(\clock/cout_652 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/d  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/d_not0002 ),
    .D(\clock/d_not0003 ),
    .Q(\clock/d_653 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_31  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [31]),
    .Q(\clock/count3 [31])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_30  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [30]),
    .Q(\clock/count3 [30])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_29  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [29]),
    .Q(\clock/count3 [29])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_28  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [28]),
    .Q(\clock/count3 [28])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_27  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [27]),
    .Q(\clock/count3 [27])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_26  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [26]),
    .Q(\clock/count3 [26])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_25  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [25]),
    .Q(\clock/count3 [25])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_24  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [24]),
    .Q(\clock/count3 [24])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_23  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [23]),
    .Q(\clock/count3 [23])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_22  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [22]),
    .Q(\clock/count3 [22])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_21  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [21]),
    .Q(\clock/count3 [21])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_20  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [20]),
    .Q(\clock/count3 [20])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_19  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [19]),
    .Q(\clock/count3 [19])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_18  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [18]),
    .Q(\clock/count3 [18])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_17  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [17]),
    .Q(\clock/count3 [17])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_16  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [16]),
    .Q(\clock/count3 [16])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_15  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [15]),
    .Q(\clock/count3 [15])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_14  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [14]),
    .Q(\clock/count3 [14])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_13  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [13]),
    .Q(\clock/count3 [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_12  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [12]),
    .Q(\clock/count3 [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_11  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [11]),
    .Q(\clock/count3 [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_10  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [10]),
    .Q(\clock/count3 [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_9  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [9]),
    .Q(\clock/count3 [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_8  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [8]),
    .Q(\clock/count3 [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_7  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [7]),
    .Q(\clock/count3 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_6  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [6]),
    .Q(\clock/count3 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_5  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [5]),
    .Q(\clock/count3 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_4  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [4]),
    .Q(\clock/count3 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_3  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [3]),
    .Q(\clock/count3 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_2  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [2]),
    .Q(\clock/count3 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_1  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [1]),
    .Q(\clock/count3 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count3_0  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count3_not0001 ),
    .D(\clock/count3_mux0000 [0]),
    .Q(\clock/count3 [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_31  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [31]),
    .Q(\clock/count2 [31])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_30  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [30]),
    .Q(\clock/count2 [30])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_29  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [29]),
    .Q(\clock/count2 [29])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_28  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [28]),
    .Q(\clock/count2 [28])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_27  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [27]),
    .Q(\clock/count2 [27])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_26  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [26]),
    .Q(\clock/count2 [26])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_25  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [25]),
    .Q(\clock/count2 [25])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_24  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [24]),
    .Q(\clock/count2 [24])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_23  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [23]),
    .Q(\clock/count2 [23])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_22  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [22]),
    .Q(\clock/count2 [22])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_21  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [21]),
    .Q(\clock/count2 [21])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_20  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [20]),
    .Q(\clock/count2 [20])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_19  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [19]),
    .Q(\clock/count2 [19])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_18  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [18]),
    .Q(\clock/count2 [18])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_17  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [17]),
    .Q(\clock/count2 [17])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_16  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [16]),
    .Q(\clock/count2 [16])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_15  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [15]),
    .Q(\clock/count2 [15])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_14  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [14]),
    .Q(\clock/count2 [14])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_13  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [13]),
    .Q(\clock/count2 [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_12  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [12]),
    .Q(\clock/count2 [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_11  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [11]),
    .Q(\clock/count2 [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_10  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [10]),
    .Q(\clock/count2 [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_9  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [9]),
    .Q(\clock/count2 [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_8  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [8]),
    .Q(\clock/count2 [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_7  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [7]),
    .Q(\clock/count2 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_6  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [6]),
    .Q(\clock/count2 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_5  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [5]),
    .Q(\clock/count2 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_4  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [4]),
    .Q(\clock/count2 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_3  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [3]),
    .Q(\clock/count2 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_2  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [2]),
    .Q(\clock/count2 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_1  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [1]),
    .Q(\clock/count2 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \clock/count2_0  (
    .C(clock_in_BUFGP_657),
    .CE(\clock/count2_not0001 ),
    .D(\clock/count2_mux0000 [0]),
    .Q(\clock/count2 [0])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count3_and0001_wg_lut<0>  (
    .I0(\clock/count3 [8]),
    .I1(\clock/count3 [9]),
    .I2(\clock/count3 [7]),
    .I3(\clock/count3 [10]),
    .O(\clock/count3_and0001_wg_lut [0])
  );
  MUXCY   \clock/count3_and0001_wg_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(\clock/count3_and0001_wg_lut [0]),
    .O(\clock/count3_and0001_wg_cy [0])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count3_and0001_wg_lut<1>  (
    .I0(\clock/count3 [11]),
    .I1(\clock/count3 [12]),
    .I2(\clock/count3 [6]),
    .I3(\clock/count3 [13]),
    .O(\clock/count3_and0001_wg_lut [1])
  );
  MUXCY   \clock/count3_and0001_wg_cy<1>  (
    .CI(\clock/count3_and0001_wg_cy [0]),
    .DI(N0),
    .S(\clock/count3_and0001_wg_lut [1]),
    .O(\clock/count3_and0001_wg_cy [1])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count3_and0001_wg_lut<2>  (
    .I0(\clock/count3 [14]),
    .I1(\clock/count3 [15]),
    .I2(\clock/count3 [5]),
    .I3(\clock/count3 [16]),
    .O(\clock/count3_and0001_wg_lut [2])
  );
  MUXCY   \clock/count3_and0001_wg_cy<2>  (
    .CI(\clock/count3_and0001_wg_cy [1]),
    .DI(N0),
    .S(\clock/count3_and0001_wg_lut [2]),
    .O(\clock/count3_and0001_wg_cy [2])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count3_and0001_wg_lut<3>  (
    .I0(\clock/count3 [17]),
    .I1(\clock/count3 [18]),
    .I2(\clock/count3 [4]),
    .I3(\clock/count3 [19]),
    .O(\clock/count3_and0001_wg_lut [3])
  );
  MUXCY   \clock/count3_and0001_wg_cy<3>  (
    .CI(\clock/count3_and0001_wg_cy [2]),
    .DI(N0),
    .S(\clock/count3_and0001_wg_lut [3]),
    .O(\clock/count3_and0001_wg_cy [3])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count3_and0001_wg_lut<4>  (
    .I0(\clock/count3 [20]),
    .I1(\clock/count3 [21]),
    .I2(\clock/count3 [3]),
    .I3(\clock/count3 [22]),
    .O(\clock/count3_and0001_wg_lut [4])
  );
  MUXCY   \clock/count3_and0001_wg_cy<4>  (
    .CI(\clock/count3_and0001_wg_cy [3]),
    .DI(N0),
    .S(\clock/count3_and0001_wg_lut [4]),
    .O(\clock/count3_and0001_wg_cy [4])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count3_and0001_wg_lut<5>  (
    .I0(\clock/count3 [23]),
    .I1(\clock/count3 [24]),
    .I2(\clock/count3 [2]),
    .I3(\clock/count3 [25]),
    .O(\clock/count3_and0001_wg_lut [5])
  );
  MUXCY   \clock/count3_and0001_wg_cy<5>  (
    .CI(\clock/count3_and0001_wg_cy [4]),
    .DI(N0),
    .S(\clock/count3_and0001_wg_lut [5]),
    .O(\clock/count3_and0001_wg_cy [5])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count3_and0001_wg_lut<6>  (
    .I0(\clock/count3 [26]),
    .I1(\clock/count3 [27]),
    .I2(\clock/count3 [1]),
    .I3(\clock/count3 [28]),
    .O(\clock/count3_and0001_wg_lut [6])
  );
  MUXCY   \clock/count3_and0001_wg_cy<6>  (
    .CI(\clock/count3_and0001_wg_cy [5]),
    .DI(N0),
    .S(\clock/count3_and0001_wg_lut [6]),
    .O(\clock/count3_and0001_wg_cy [6])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count3_and0001_wg_lut<7>  (
    .I0(\clock/count3 [29]),
    .I1(\clock/count3 [30]),
    .I2(\clock/count3 [0]),
    .I3(\clock/count3 [31]),
    .O(\clock/count3_and0001_wg_lut [7])
  );
  MUXCY   \clock/count3_and0001_wg_cy<7>  (
    .CI(\clock/count3_and0001_wg_cy [6]),
    .DI(N0),
    .S(\clock/count3_and0001_wg_lut [7]),
    .O(\clock/count3_and0001 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count3_cmp_eq0000_wg_lut<0>  (
    .I0(\clock/count2 [8]),
    .I1(\clock/count2 [9]),
    .I2(\clock/count2 [7]),
    .I3(\clock/count2 [10]),
    .O(\clock/count3_cmp_eq0000_wg_lut [0])
  );
  MUXCY   \clock/count3_cmp_eq0000_wg_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(\clock/count3_cmp_eq0000_wg_lut [0]),
    .O(\clock/count3_cmp_eq0000_wg_cy [0])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count3_cmp_eq0000_wg_lut<1>  (
    .I0(\clock/count2 [11]),
    .I1(\clock/count2 [12]),
    .I2(\clock/count2 [6]),
    .I3(\clock/count2 [13]),
    .O(\clock/count3_cmp_eq0000_wg_lut [1])
  );
  MUXCY   \clock/count3_cmp_eq0000_wg_cy<1>  (
    .CI(\clock/count3_cmp_eq0000_wg_cy [0]),
    .DI(N0),
    .S(\clock/count3_cmp_eq0000_wg_lut [1]),
    .O(\clock/count3_cmp_eq0000_wg_cy [1])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count3_cmp_eq0000_wg_lut<2>  (
    .I0(\clock/count2 [14]),
    .I1(\clock/count2 [15]),
    .I2(\clock/count2 [5]),
    .I3(\clock/count2 [16]),
    .O(\clock/count3_cmp_eq0000_wg_lut [2])
  );
  MUXCY   \clock/count3_cmp_eq0000_wg_cy<2>  (
    .CI(\clock/count3_cmp_eq0000_wg_cy [1]),
    .DI(N0),
    .S(\clock/count3_cmp_eq0000_wg_lut [2]),
    .O(\clock/count3_cmp_eq0000_wg_cy [2])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count3_cmp_eq0000_wg_lut<3>  (
    .I0(\clock/count2 [17]),
    .I1(\clock/count2 [18]),
    .I2(\clock/count2 [4]),
    .I3(\clock/count2 [19]),
    .O(\clock/count3_cmp_eq0000_wg_lut [3])
  );
  MUXCY   \clock/count3_cmp_eq0000_wg_cy<3>  (
    .CI(\clock/count3_cmp_eq0000_wg_cy [2]),
    .DI(N0),
    .S(\clock/count3_cmp_eq0000_wg_lut [3]),
    .O(\clock/count3_cmp_eq0000_wg_cy [3])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count3_cmp_eq0000_wg_lut<4>  (
    .I0(\clock/count2 [20]),
    .I1(\clock/count2 [21]),
    .I2(\clock/count2 [3]),
    .I3(\clock/count2 [22]),
    .O(\clock/count3_cmp_eq0000_wg_lut [4])
  );
  MUXCY   \clock/count3_cmp_eq0000_wg_cy<4>  (
    .CI(\clock/count3_cmp_eq0000_wg_cy [3]),
    .DI(N0),
    .S(\clock/count3_cmp_eq0000_wg_lut [4]),
    .O(\clock/count3_cmp_eq0000_wg_cy [4])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count3_cmp_eq0000_wg_lut<5>  (
    .I0(\clock/count2 [23]),
    .I1(\clock/count2 [24]),
    .I2(\clock/count2 [2]),
    .I3(\clock/count2 [25]),
    .O(\clock/count3_cmp_eq0000_wg_lut [5])
  );
  MUXCY   \clock/count3_cmp_eq0000_wg_cy<5>  (
    .CI(\clock/count3_cmp_eq0000_wg_cy [4]),
    .DI(N0),
    .S(\clock/count3_cmp_eq0000_wg_lut [5]),
    .O(\clock/count3_cmp_eq0000_wg_cy [5])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count3_cmp_eq0000_wg_lut<6>  (
    .I0(\clock/count2 [26]),
    .I1(\clock/count2 [27]),
    .I2(\clock/count2 [1]),
    .I3(\clock/count2 [28]),
    .O(\clock/count3_cmp_eq0000_wg_lut [6])
  );
  MUXCY   \clock/count3_cmp_eq0000_wg_cy<6>  (
    .CI(\clock/count3_cmp_eq0000_wg_cy [5]),
    .DI(N0),
    .S(\clock/count3_cmp_eq0000_wg_lut [6]),
    .O(\clock/count3_cmp_eq0000_wg_cy [6])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count3_cmp_eq0000_wg_lut<7>  (
    .I0(\clock/count2 [29]),
    .I1(\clock/count2 [30]),
    .I2(\clock/count2 [0]),
    .I3(\clock/count2 [31]),
    .O(\clock/count3_cmp_eq0000_wg_lut [7])
  );
  MUXCY   \clock/count3_cmp_eq0000_wg_cy<7>  (
    .CI(\clock/count3_cmp_eq0000_wg_cy [6]),
    .DI(N0),
    .S(\clock/count3_cmp_eq0000_wg_lut [7]),
    .O(\clock/count3_cmp_eq0000 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count2_cmp_eq0000_wg_lut<0>  (
    .I0(\clock/count1 [8]),
    .I1(\clock/count1 [9]),
    .I2(\clock/count1 [7]),
    .I3(\clock/count1 [10]),
    .O(\clock/count2_cmp_eq0000_wg_lut [0])
  );
  MUXCY   \clock/count2_cmp_eq0000_wg_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(\clock/count2_cmp_eq0000_wg_lut [0]),
    .O(\clock/count2_cmp_eq0000_wg_cy [0])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count2_cmp_eq0000_wg_lut<1>  (
    .I0(\clock/count1 [11]),
    .I1(\clock/count1 [12]),
    .I2(\clock/count1 [6]),
    .I3(\clock/count1 [13]),
    .O(\clock/count2_cmp_eq0000_wg_lut [1])
  );
  MUXCY   \clock/count2_cmp_eq0000_wg_cy<1>  (
    .CI(\clock/count2_cmp_eq0000_wg_cy [0]),
    .DI(N0),
    .S(\clock/count2_cmp_eq0000_wg_lut [1]),
    .O(\clock/count2_cmp_eq0000_wg_cy [1])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count2_cmp_eq0000_wg_lut<2>  (
    .I0(\clock/count1 [14]),
    .I1(\clock/count1 [15]),
    .I2(\clock/count1 [5]),
    .I3(\clock/count1 [16]),
    .O(\clock/count2_cmp_eq0000_wg_lut [2])
  );
  MUXCY   \clock/count2_cmp_eq0000_wg_cy<2>  (
    .CI(\clock/count2_cmp_eq0000_wg_cy [1]),
    .DI(N0),
    .S(\clock/count2_cmp_eq0000_wg_lut [2]),
    .O(\clock/count2_cmp_eq0000_wg_cy [2])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count2_cmp_eq0000_wg_lut<3>  (
    .I0(\clock/count1 [17]),
    .I1(\clock/count1 [18]),
    .I2(\clock/count1 [4]),
    .I3(\clock/count1 [19]),
    .O(\clock/count2_cmp_eq0000_wg_lut [3])
  );
  MUXCY   \clock/count2_cmp_eq0000_wg_cy<3>  (
    .CI(\clock/count2_cmp_eq0000_wg_cy [2]),
    .DI(N0),
    .S(\clock/count2_cmp_eq0000_wg_lut [3]),
    .O(\clock/count2_cmp_eq0000_wg_cy [3])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count2_cmp_eq0000_wg_lut<4>  (
    .I0(\clock/count1 [20]),
    .I1(\clock/count1 [21]),
    .I2(\clock/count1 [3]),
    .I3(\clock/count1 [22]),
    .O(\clock/count2_cmp_eq0000_wg_lut [4])
  );
  MUXCY   \clock/count2_cmp_eq0000_wg_cy<4>  (
    .CI(\clock/count2_cmp_eq0000_wg_cy [3]),
    .DI(N0),
    .S(\clock/count2_cmp_eq0000_wg_lut [4]),
    .O(\clock/count2_cmp_eq0000_wg_cy [4])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count2_cmp_eq0000_wg_lut<5>  (
    .I0(\clock/count1 [23]),
    .I1(\clock/count1 [24]),
    .I2(\clock/count1 [2]),
    .I3(\clock/count1 [25]),
    .O(\clock/count2_cmp_eq0000_wg_lut [5])
  );
  MUXCY   \clock/count2_cmp_eq0000_wg_cy<5>  (
    .CI(\clock/count2_cmp_eq0000_wg_cy [4]),
    .DI(N0),
    .S(\clock/count2_cmp_eq0000_wg_lut [5]),
    .O(\clock/count2_cmp_eq0000_wg_cy [5])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count2_cmp_eq0000_wg_lut<6>  (
    .I0(\clock/count1 [26]),
    .I1(\clock/count1 [27]),
    .I2(\clock/count1 [1]),
    .I3(\clock/count1 [28]),
    .O(\clock/count2_cmp_eq0000_wg_lut [6])
  );
  MUXCY   \clock/count2_cmp_eq0000_wg_cy<6>  (
    .CI(\clock/count2_cmp_eq0000_wg_cy [5]),
    .DI(N0),
    .S(\clock/count2_cmp_eq0000_wg_lut [6]),
    .O(\clock/count2_cmp_eq0000_wg_cy [6])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count2_cmp_eq0000_wg_lut<7>  (
    .I0(\clock/count1 [29]),
    .I1(\clock/count1 [30]),
    .I2(\clock/count1 [0]),
    .I3(\clock/count1 [31]),
    .O(\clock/count2_cmp_eq0000_wg_lut [7])
  );
  MUXCY   \clock/count2_cmp_eq0000_wg_cy<7>  (
    .CI(\clock/count2_cmp_eq0000_wg_cy [6]),
    .DI(N0),
    .S(\clock/count2_cmp_eq0000_wg_lut [7]),
    .O(\clock/count2_cmp_eq0000 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count0_cmp_eq0000_wg_lut<0>  (
    .I0(\clock/count0 [8]),
    .I1(\clock/count0 [9]),
    .I2(\clock/count0 [7]),
    .I3(\clock/count0 [10]),
    .O(\clock/count0_cmp_eq0000_wg_lut [0])
  );
  MUXCY   \clock/count0_cmp_eq0000_wg_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(\clock/count0_cmp_eq0000_wg_lut [0]),
    .O(\clock/count0_cmp_eq0000_wg_cy [0])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count0_cmp_eq0000_wg_lut<1>  (
    .I0(\clock/count0 [11]),
    .I1(\clock/count0 [12]),
    .I2(\clock/count0 [6]),
    .I3(\clock/count0 [13]),
    .O(\clock/count0_cmp_eq0000_wg_lut [1])
  );
  MUXCY   \clock/count0_cmp_eq0000_wg_cy<1>  (
    .CI(\clock/count0_cmp_eq0000_wg_cy [0]),
    .DI(N0),
    .S(\clock/count0_cmp_eq0000_wg_lut [1]),
    .O(\clock/count0_cmp_eq0000_wg_cy [1])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count0_cmp_eq0000_wg_lut<2>  (
    .I0(\clock/count0 [14]),
    .I1(\clock/count0 [15]),
    .I2(\clock/count0 [5]),
    .I3(\clock/count0 [16]),
    .O(\clock/count0_cmp_eq0000_wg_lut [2])
  );
  MUXCY   \clock/count0_cmp_eq0000_wg_cy<2>  (
    .CI(\clock/count0_cmp_eq0000_wg_cy [1]),
    .DI(N0),
    .S(\clock/count0_cmp_eq0000_wg_lut [2]),
    .O(\clock/count0_cmp_eq0000_wg_cy [2])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count0_cmp_eq0000_wg_lut<3>  (
    .I0(\clock/count0 [17]),
    .I1(\clock/count0 [18]),
    .I2(\clock/count0 [4]),
    .I3(\clock/count0 [19]),
    .O(\clock/count0_cmp_eq0000_wg_lut [3])
  );
  MUXCY   \clock/count0_cmp_eq0000_wg_cy<3>  (
    .CI(\clock/count0_cmp_eq0000_wg_cy [2]),
    .DI(N0),
    .S(\clock/count0_cmp_eq0000_wg_lut [3]),
    .O(\clock/count0_cmp_eq0000_wg_cy [3])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \clock/count0_cmp_eq0000_wg_lut<4>  (
    .I0(\clock/count0 [20]),
    .I1(\clock/count0 [21]),
    .I2(\clock/count0 [3]),
    .I3(\clock/count0 [22]),
    .O(\clock/count0_cmp_eq0000_wg_lut [4])
  );
  MUXCY   \clock/count0_cmp_eq0000_wg_cy<4>  (
    .CI(\clock/count0_cmp_eq0000_wg_cy [3]),
    .DI(N0),
    .S(\clock/count0_cmp_eq0000_wg_lut [4]),
    .O(\clock/count0_cmp_eq0000_wg_cy [4])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count0_cmp_eq0000_wg_lut<5>  (
    .I0(\clock/count0 [23]),
    .I1(\clock/count0 [24]),
    .I2(\clock/count0 [2]),
    .I3(\clock/count0 [25]),
    .O(\clock/count0_cmp_eq0000_wg_lut [5])
  );
  MUXCY   \clock/count0_cmp_eq0000_wg_cy<5>  (
    .CI(\clock/count0_cmp_eq0000_wg_cy [4]),
    .DI(N0),
    .S(\clock/count0_cmp_eq0000_wg_lut [5]),
    .O(\clock/count0_cmp_eq0000_wg_cy [5])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count0_cmp_eq0000_wg_lut<6>  (
    .I0(\clock/count0 [26]),
    .I1(\clock/count0 [27]),
    .I2(\clock/count0 [1]),
    .I3(\clock/count0 [28]),
    .O(\clock/count0_cmp_eq0000_wg_lut [6])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  \clock/count0_cmp_eq0000_wg_lut<7>  (
    .I0(\clock/count0 [29]),
    .I1(\clock/count0 [30]),
    .I2(\clock/count0 [0]),
    .I3(\clock/count0 [31]),
    .O(\clock/count0_cmp_eq0000_wg_lut [7])
  );
  LUT3 #(
    .INIT ( 8'h75 ))
  \display/e1  (
    .I0(\tff1/d_666 ),
    .I1(\tff3/d_668 ),
    .I2(\tff2/d_667 ),
    .O(e_OBUF_661)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \display/c1  (
    .I0(\tff1/d_666 ),
    .I1(\tff2/d_667 ),
    .I2(\tff3/d_668 ),
    .O(c_OBUF_13)
  );
  LUT3 #(
    .INIT ( 8'h89 ))
  \display/g_1  (
    .I0(\tff3/d_668 ),
    .I1(\tff2/d_667 ),
    .I2(\tff1/d_666 ),
    .O(g__OBUF_665)
  );
  LUT3 #(
    .INIT ( 8'h2B ))
  \display/f_1  (
    .I0(\tff3/d_668 ),
    .I1(\tff2/d_667 ),
    .I2(\tff1/d_666 ),
    .O(f__OBUF_663)
  );
  LUT3 #(
    .INIT ( 8'h14 ))
  \display/b1  (
    .I0(\tff3/d_668 ),
    .I1(\tff1/d_666 ),
    .I2(\tff2/d_667 ),
    .O(b_OBUF_11)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \display/a1  (
    .I0(\tff2/d_667 ),
    .I1(\tff1/d_666 ),
    .I2(\tff3/d_668 ),
    .O(a_OBUF_9)
  );
  LUT3 #(
    .INIT ( 8'h49 ))
  \display/d1  (
    .I0(\tff3/d_668 ),
    .I1(\tff2/d_667 ),
    .I2(\tff1/d_666 ),
    .O(d_OBUF_659)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<9>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [9]),
    .O(\clock/count3_mux0000 [9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<8>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [8]),
    .O(\clock/count3_mux0000 [8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<7>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [7]),
    .O(\clock/count3_mux0000 [7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<6>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [6]),
    .O(\clock/count3_mux0000 [6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<5>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [5]),
    .O(\clock/count3_mux0000 [5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<4>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [4]),
    .O(\clock/count3_mux0000 [4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<3>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [3]),
    .O(\clock/count3_mux0000 [3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<2>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [2]),
    .O(\clock/count3_mux0000 [2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<1>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [1]),
    .O(\clock/count3_mux0000 [1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<0>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [0]),
    .O(\clock/count3_mux0000 [0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<9>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [9]),
    .O(\clock/count2_mux0000 [9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<8>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [8]),
    .O(\clock/count2_mux0000 [8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<7>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [7]),
    .O(\clock/count2_mux0000 [7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<6>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [6]),
    .O(\clock/count2_mux0000 [6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<5>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [5]),
    .O(\clock/count2_mux0000 [5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<4>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [4]),
    .O(\clock/count2_mux0000 [4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<3>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [3]),
    .O(\clock/count2_mux0000 [3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<2>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [2]),
    .O(\clock/count2_mux0000 [2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<1>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [1]),
    .O(\clock/count2_mux0000 [1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<0>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [0]),
    .O(\clock/count2_mux0000 [0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<10>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [10]),
    .O(\clock/count3_mux0000 [10])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<10>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [10]),
    .O(\clock/count2_mux0000 [10])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<11>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [11]),
    .O(\clock/count3_mux0000 [11])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<11>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [11]),
    .O(\clock/count2_mux0000 [11])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<12>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [12]),
    .O(\clock/count3_mux0000 [12])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<12>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [12]),
    .O(\clock/count2_mux0000 [12])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<13>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [13]),
    .O(\clock/count3_mux0000 [13])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<13>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [13]),
    .O(\clock/count2_mux0000 [13])
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \clock/count2_not00011  (
    .I0(\clock/count0_cmp_eq0000 ),
    .I1(\clock/count2_cmp_eq0000 ),
    .I2(\clock/count3_cmp_eq0000 ),
    .O(\clock/count2_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \clock/d_not00021  (
    .I0(\clock/count3_and0001 ),
    .I1(\clock/count3_cmp_eq0000 ),
    .I2(\clock/count2_cmp_eq0000 ),
    .I3(\clock/count0_cmp_eq0000 ),
    .O(\clock/d_not0002 )
  );
  LUT4 #(
    .INIT ( 16'h000E ))
  \clock/count3_not00011  (
    .I0(\clock/count3_and0001 ),
    .I1(\clock/count3_cmp_eq0000 ),
    .I2(\clock/count2_cmp_eq0000 ),
    .I3(\clock/count0_cmp_eq0000 ),
    .O(\clock/count3_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \clock/count1_and00001  (
    .I0(\clock/count0_cmp_eq0000 ),
    .I1(\clock/count2_cmp_eq0000 ),
    .O(\clock/count1_and0000 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<14>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [14]),
    .O(\clock/count3_mux0000 [14])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<14>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [14]),
    .O(\clock/count2_mux0000 [14])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<15>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [15]),
    .O(\clock/count3_mux0000 [15])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<15>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [15]),
    .O(\clock/count2_mux0000 [15])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<16>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [16]),
    .O(\clock/count3_mux0000 [16])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<16>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [16]),
    .O(\clock/count2_mux0000 [16])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<17>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [17]),
    .O(\clock/count3_mux0000 [17])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<17>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [17]),
    .O(\clock/count2_mux0000 [17])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<18>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [18]),
    .O(\clock/count3_mux0000 [18])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<18>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [18]),
    .O(\clock/count2_mux0000 [18])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<19>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [19]),
    .O(\clock/count3_mux0000 [19])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<19>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [19]),
    .O(\clock/count2_mux0000 [19])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<20>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [20]),
    .O(\clock/count3_mux0000 [20])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<20>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [20]),
    .O(\clock/count2_mux0000 [20])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<21>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [21]),
    .O(\clock/count3_mux0000 [21])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<21>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [21]),
    .O(\clock/count2_mux0000 [21])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<22>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [22]),
    .O(\clock/count3_mux0000 [22])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<22>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [22]),
    .O(\clock/count2_mux0000 [22])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<23>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [23]),
    .O(\clock/count3_mux0000 [23])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<23>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [23]),
    .O(\clock/count2_mux0000 [23])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<24>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [24]),
    .O(\clock/count3_mux0000 [24])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<24>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [24]),
    .O(\clock/count2_mux0000 [24])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<25>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [25]),
    .O(\clock/count3_mux0000 [25])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<25>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [25]),
    .O(\clock/count2_mux0000 [25])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<26>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [26]),
    .O(\clock/count3_mux0000 [26])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<26>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [26]),
    .O(\clock/count2_mux0000 [26])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<27>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [27]),
    .O(\clock/count3_mux0000 [27])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<27>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [27]),
    .O(\clock/count2_mux0000 [27])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<28>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [28]),
    .O(\clock/count3_mux0000 [28])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<28>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [28]),
    .O(\clock/count2_mux0000 [28])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<29>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [29]),
    .O(\clock/count3_mux0000 [29])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<29>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [29]),
    .O(\clock/count2_mux0000 [29])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<30>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [30]),
    .O(\clock/count3_mux0000 [30])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<30>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [30]),
    .O(\clock/count2_mux0000 [30])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count3_mux0000<31>1  (
    .I0(\clock/count3_cmp_eq0000 ),
    .I1(\clock/count3_addsub0000 [31]),
    .O(\clock/count3_mux0000 [31])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \clock/count2_mux0000<31>1  (
    .I0(\clock/count2_cmp_eq0000 ),
    .I1(\clock/count2_addsub0000 [31]),
    .O(\clock/count2_mux0000 [31])
  );
  OBUF   f__OBUF (
    .I(f__OBUF_663),
    .O(f_)
  );
  OBUF   g__OBUF (
    .I(g__OBUF_665),
    .O(g_)
  );
  OBUF   a_OBUF (
    .I(a_OBUF_9),
    .O(a)
  );
  OBUF   b_OBUF (
    .I(b_OBUF_11),
    .O(b)
  );
  OBUF   Q0_OBUF (
    .I(Q0_OBUF_3),
    .O(Q0)
  );
  OBUF   c_OBUF (
    .I(c_OBUF_13),
    .O(c)
  );
  OBUF   Q1_OBUF (
    .I(Q1_OBUF_5),
    .O(Q1)
  );
  OBUF   d_OBUF (
    .I(d_OBUF_659),
    .O(d)
  );
  OBUF   Q2_OBUF (
    .I(Q2_OBUF_7),
    .O(Q2)
  );
  OBUF   e_OBUF (
    .I(e_OBUF_661),
    .O(e)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<30>_rt  (
    .I0(\clock/count1 [30]),
    .O(\clock/Mcount_count1_cy<30>_rt_249 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<29>_rt  (
    .I0(\clock/count1 [29]),
    .O(\clock/Mcount_count1_cy<29>_rt_245 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<28>_rt  (
    .I0(\clock/count1 [28]),
    .O(\clock/Mcount_count1_cy<28>_rt_243 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<27>_rt  (
    .I0(\clock/count1 [27]),
    .O(\clock/Mcount_count1_cy<27>_rt_241 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<26>_rt  (
    .I0(\clock/count1 [26]),
    .O(\clock/Mcount_count1_cy<26>_rt_239 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<25>_rt  (
    .I0(\clock/count1 [25]),
    .O(\clock/Mcount_count1_cy<25>_rt_237 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<24>_rt  (
    .I0(\clock/count1 [24]),
    .O(\clock/Mcount_count1_cy<24>_rt_235 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<23>_rt  (
    .I0(\clock/count1 [23]),
    .O(\clock/Mcount_count1_cy<23>_rt_233 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<22>_rt  (
    .I0(\clock/count1 [22]),
    .O(\clock/Mcount_count1_cy<22>_rt_231 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<21>_rt  (
    .I0(\clock/count1 [21]),
    .O(\clock/Mcount_count1_cy<21>_rt_229 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<20>_rt  (
    .I0(\clock/count1 [20]),
    .O(\clock/Mcount_count1_cy<20>_rt_227 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<19>_rt  (
    .I0(\clock/count1 [19]),
    .O(\clock/Mcount_count1_cy<19>_rt_223 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<18>_rt  (
    .I0(\clock/count1 [18]),
    .O(\clock/Mcount_count1_cy<18>_rt_221 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<17>_rt  (
    .I0(\clock/count1 [17]),
    .O(\clock/Mcount_count1_cy<17>_rt_219 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<16>_rt  (
    .I0(\clock/count1 [16]),
    .O(\clock/Mcount_count1_cy<16>_rt_217 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<15>_rt  (
    .I0(\clock/count1 [15]),
    .O(\clock/Mcount_count1_cy<15>_rt_215 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<14>_rt  (
    .I0(\clock/count1 [14]),
    .O(\clock/Mcount_count1_cy<14>_rt_213 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<13>_rt  (
    .I0(\clock/count1 [13]),
    .O(\clock/Mcount_count1_cy<13>_rt_211 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<12>_rt  (
    .I0(\clock/count1 [12]),
    .O(\clock/Mcount_count1_cy<12>_rt_209 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<11>_rt  (
    .I0(\clock/count1 [11]),
    .O(\clock/Mcount_count1_cy<11>_rt_207 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<10>_rt  (
    .I0(\clock/count1 [10]),
    .O(\clock/Mcount_count1_cy<10>_rt_205 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<9>_rt  (
    .I0(\clock/count1 [9]),
    .O(\clock/Mcount_count1_cy<9>_rt_263 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<8>_rt  (
    .I0(\clock/count1 [8]),
    .O(\clock/Mcount_count1_cy<8>_rt_261 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<7>_rt  (
    .I0(\clock/count1 [7]),
    .O(\clock/Mcount_count1_cy<7>_rt_259 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<6>_rt  (
    .I0(\clock/count1 [6]),
    .O(\clock/Mcount_count1_cy<6>_rt_257 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<5>_rt  (
    .I0(\clock/count1 [5]),
    .O(\clock/Mcount_count1_cy<5>_rt_255 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<4>_rt  (
    .I0(\clock/count1 [4]),
    .O(\clock/Mcount_count1_cy<4>_rt_253 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<3>_rt  (
    .I0(\clock/count1 [3]),
    .O(\clock/Mcount_count1_cy<3>_rt_251 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<2>_rt  (
    .I0(\clock/count1 [2]),
    .O(\clock/Mcount_count1_cy<2>_rt_247 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_cy<1>_rt  (
    .I0(\clock/count1 [1]),
    .O(\clock/Mcount_count1_cy<1>_rt_225 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<30>_rt  (
    .I0(\clock/count0 [30]),
    .O(\clock/Mcount_count0_cy<30>_rt_186 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<29>_rt  (
    .I0(\clock/count0 [29]),
    .O(\clock/Mcount_count0_cy<29>_rt_182 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<28>_rt  (
    .I0(\clock/count0 [28]),
    .O(\clock/Mcount_count0_cy<28>_rt_180 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<27>_rt  (
    .I0(\clock/count0 [27]),
    .O(\clock/Mcount_count0_cy<27>_rt_178 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<26>_rt  (
    .I0(\clock/count0 [26]),
    .O(\clock/Mcount_count0_cy<26>_rt_176 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<25>_rt  (
    .I0(\clock/count0 [25]),
    .O(\clock/Mcount_count0_cy<25>_rt_174 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<24>_rt  (
    .I0(\clock/count0 [24]),
    .O(\clock/Mcount_count0_cy<24>_rt_172 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<23>_rt  (
    .I0(\clock/count0 [23]),
    .O(\clock/Mcount_count0_cy<23>_rt_170 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<22>_rt  (
    .I0(\clock/count0 [22]),
    .O(\clock/Mcount_count0_cy<22>_rt_168 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<21>_rt  (
    .I0(\clock/count0 [21]),
    .O(\clock/Mcount_count0_cy<21>_rt_166 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<20>_rt  (
    .I0(\clock/count0 [20]),
    .O(\clock/Mcount_count0_cy<20>_rt_164 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<19>_rt  (
    .I0(\clock/count0 [19]),
    .O(\clock/Mcount_count0_cy<19>_rt_160 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<18>_rt  (
    .I0(\clock/count0 [18]),
    .O(\clock/Mcount_count0_cy<18>_rt_158 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<17>_rt  (
    .I0(\clock/count0 [17]),
    .O(\clock/Mcount_count0_cy<17>_rt_156 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<16>_rt  (
    .I0(\clock/count0 [16]),
    .O(\clock/Mcount_count0_cy<16>_rt_154 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<15>_rt  (
    .I0(\clock/count0 [15]),
    .O(\clock/Mcount_count0_cy<15>_rt_152 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<14>_rt  (
    .I0(\clock/count0 [14]),
    .O(\clock/Mcount_count0_cy<14>_rt_150 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<13>_rt  (
    .I0(\clock/count0 [13]),
    .O(\clock/Mcount_count0_cy<13>_rt_148 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<12>_rt  (
    .I0(\clock/count0 [12]),
    .O(\clock/Mcount_count0_cy<12>_rt_146 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<11>_rt  (
    .I0(\clock/count0 [11]),
    .O(\clock/Mcount_count0_cy<11>_rt_144 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<10>_rt  (
    .I0(\clock/count0 [10]),
    .O(\clock/Mcount_count0_cy<10>_rt_142 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<9>_rt  (
    .I0(\clock/count0 [9]),
    .O(\clock/Mcount_count0_cy<9>_rt_200 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<8>_rt  (
    .I0(\clock/count0 [8]),
    .O(\clock/Mcount_count0_cy<8>_rt_198 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<7>_rt  (
    .I0(\clock/count0 [7]),
    .O(\clock/Mcount_count0_cy<7>_rt_196 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<6>_rt  (
    .I0(\clock/count0 [6]),
    .O(\clock/Mcount_count0_cy<6>_rt_194 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<5>_rt  (
    .I0(\clock/count0 [5]),
    .O(\clock/Mcount_count0_cy<5>_rt_192 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<4>_rt  (
    .I0(\clock/count0 [4]),
    .O(\clock/Mcount_count0_cy<4>_rt_190 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<3>_rt  (
    .I0(\clock/count0 [3]),
    .O(\clock/Mcount_count0_cy<3>_rt_188 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<2>_rt  (
    .I0(\clock/count0 [2]),
    .O(\clock/Mcount_count0_cy<2>_rt_184 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_cy<1>_rt  (
    .I0(\clock/count0 [1]),
    .O(\clock/Mcount_count0_cy<1>_rt_162 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<30>_rt  (
    .I0(\clock/count3 [30]),
    .O(\clock/Madd_count3_addsub0000_cy<30>_rt_123 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<29>_rt  (
    .I0(\clock/count3 [29]),
    .O(\clock/Madd_count3_addsub0000_cy<29>_rt_119 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<28>_rt  (
    .I0(\clock/count3 [28]),
    .O(\clock/Madd_count3_addsub0000_cy<28>_rt_117 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<27>_rt  (
    .I0(\clock/count3 [27]),
    .O(\clock/Madd_count3_addsub0000_cy<27>_rt_115 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<26>_rt  (
    .I0(\clock/count3 [26]),
    .O(\clock/Madd_count3_addsub0000_cy<26>_rt_113 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<25>_rt  (
    .I0(\clock/count3 [25]),
    .O(\clock/Madd_count3_addsub0000_cy<25>_rt_111 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<24>_rt  (
    .I0(\clock/count3 [24]),
    .O(\clock/Madd_count3_addsub0000_cy<24>_rt_109 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<23>_rt  (
    .I0(\clock/count3 [23]),
    .O(\clock/Madd_count3_addsub0000_cy<23>_rt_107 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<22>_rt  (
    .I0(\clock/count3 [22]),
    .O(\clock/Madd_count3_addsub0000_cy<22>_rt_105 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<21>_rt  (
    .I0(\clock/count3 [21]),
    .O(\clock/Madd_count3_addsub0000_cy<21>_rt_103 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<20>_rt  (
    .I0(\clock/count3 [20]),
    .O(\clock/Madd_count3_addsub0000_cy<20>_rt_101 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<19>_rt  (
    .I0(\clock/count3 [19]),
    .O(\clock/Madd_count3_addsub0000_cy<19>_rt_97 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<18>_rt  (
    .I0(\clock/count3 [18]),
    .O(\clock/Madd_count3_addsub0000_cy<18>_rt_95 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<17>_rt  (
    .I0(\clock/count3 [17]),
    .O(\clock/Madd_count3_addsub0000_cy<17>_rt_93 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<16>_rt  (
    .I0(\clock/count3 [16]),
    .O(\clock/Madd_count3_addsub0000_cy<16>_rt_91 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<15>_rt  (
    .I0(\clock/count3 [15]),
    .O(\clock/Madd_count3_addsub0000_cy<15>_rt_89 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<14>_rt  (
    .I0(\clock/count3 [14]),
    .O(\clock/Madd_count3_addsub0000_cy<14>_rt_87 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<13>_rt  (
    .I0(\clock/count3 [13]),
    .O(\clock/Madd_count3_addsub0000_cy<13>_rt_85 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<12>_rt  (
    .I0(\clock/count3 [12]),
    .O(\clock/Madd_count3_addsub0000_cy<12>_rt_83 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<11>_rt  (
    .I0(\clock/count3 [11]),
    .O(\clock/Madd_count3_addsub0000_cy<11>_rt_81 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<10>_rt  (
    .I0(\clock/count3 [10]),
    .O(\clock/Madd_count3_addsub0000_cy<10>_rt_79 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<9>_rt  (
    .I0(\clock/count3 [9]),
    .O(\clock/Madd_count3_addsub0000_cy<9>_rt_137 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<8>_rt  (
    .I0(\clock/count3 [8]),
    .O(\clock/Madd_count3_addsub0000_cy<8>_rt_135 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<7>_rt  (
    .I0(\clock/count3 [7]),
    .O(\clock/Madd_count3_addsub0000_cy<7>_rt_133 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<6>_rt  (
    .I0(\clock/count3 [6]),
    .O(\clock/Madd_count3_addsub0000_cy<6>_rt_131 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<5>_rt  (
    .I0(\clock/count3 [5]),
    .O(\clock/Madd_count3_addsub0000_cy<5>_rt_129 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<4>_rt  (
    .I0(\clock/count3 [4]),
    .O(\clock/Madd_count3_addsub0000_cy<4>_rt_127 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<3>_rt  (
    .I0(\clock/count3 [3]),
    .O(\clock/Madd_count3_addsub0000_cy<3>_rt_125 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<2>_rt  (
    .I0(\clock/count3 [2]),
    .O(\clock/Madd_count3_addsub0000_cy<2>_rt_121 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_cy<1>_rt  (
    .I0(\clock/count3 [1]),
    .O(\clock/Madd_count3_addsub0000_cy<1>_rt_99 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<30>_rt  (
    .I0(\clock/count2 [30]),
    .O(\clock/Madd_count2_addsub0000_cy<30>_rt_60 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<29>_rt  (
    .I0(\clock/count2 [29]),
    .O(\clock/Madd_count2_addsub0000_cy<29>_rt_56 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<28>_rt  (
    .I0(\clock/count2 [28]),
    .O(\clock/Madd_count2_addsub0000_cy<28>_rt_54 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<27>_rt  (
    .I0(\clock/count2 [27]),
    .O(\clock/Madd_count2_addsub0000_cy<27>_rt_52 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<26>_rt  (
    .I0(\clock/count2 [26]),
    .O(\clock/Madd_count2_addsub0000_cy<26>_rt_50 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<25>_rt  (
    .I0(\clock/count2 [25]),
    .O(\clock/Madd_count2_addsub0000_cy<25>_rt_48 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<24>_rt  (
    .I0(\clock/count2 [24]),
    .O(\clock/Madd_count2_addsub0000_cy<24>_rt_46 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<23>_rt  (
    .I0(\clock/count2 [23]),
    .O(\clock/Madd_count2_addsub0000_cy<23>_rt_44 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<22>_rt  (
    .I0(\clock/count2 [22]),
    .O(\clock/Madd_count2_addsub0000_cy<22>_rt_42 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<21>_rt  (
    .I0(\clock/count2 [21]),
    .O(\clock/Madd_count2_addsub0000_cy<21>_rt_40 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<20>_rt  (
    .I0(\clock/count2 [20]),
    .O(\clock/Madd_count2_addsub0000_cy<20>_rt_38 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<19>_rt  (
    .I0(\clock/count2 [19]),
    .O(\clock/Madd_count2_addsub0000_cy<19>_rt_34 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<18>_rt  (
    .I0(\clock/count2 [18]),
    .O(\clock/Madd_count2_addsub0000_cy<18>_rt_32 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<17>_rt  (
    .I0(\clock/count2 [17]),
    .O(\clock/Madd_count2_addsub0000_cy<17>_rt_30 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<16>_rt  (
    .I0(\clock/count2 [16]),
    .O(\clock/Madd_count2_addsub0000_cy<16>_rt_28 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<15>_rt  (
    .I0(\clock/count2 [15]),
    .O(\clock/Madd_count2_addsub0000_cy<15>_rt_26 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<14>_rt  (
    .I0(\clock/count2 [14]),
    .O(\clock/Madd_count2_addsub0000_cy<14>_rt_24 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<13>_rt  (
    .I0(\clock/count2 [13]),
    .O(\clock/Madd_count2_addsub0000_cy<13>_rt_22 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<12>_rt  (
    .I0(\clock/count2 [12]),
    .O(\clock/Madd_count2_addsub0000_cy<12>_rt_20 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<11>_rt  (
    .I0(\clock/count2 [11]),
    .O(\clock/Madd_count2_addsub0000_cy<11>_rt_18 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<10>_rt  (
    .I0(\clock/count2 [10]),
    .O(\clock/Madd_count2_addsub0000_cy<10>_rt_16 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<9>_rt  (
    .I0(\clock/count2 [9]),
    .O(\clock/Madd_count2_addsub0000_cy<9>_rt_74 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<8>_rt  (
    .I0(\clock/count2 [8]),
    .O(\clock/Madd_count2_addsub0000_cy<8>_rt_72 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<7>_rt  (
    .I0(\clock/count2 [7]),
    .O(\clock/Madd_count2_addsub0000_cy<7>_rt_70 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<6>_rt  (
    .I0(\clock/count2 [6]),
    .O(\clock/Madd_count2_addsub0000_cy<6>_rt_68 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<5>_rt  (
    .I0(\clock/count2 [5]),
    .O(\clock/Madd_count2_addsub0000_cy<5>_rt_66 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<4>_rt  (
    .I0(\clock/count2 [4]),
    .O(\clock/Madd_count2_addsub0000_cy<4>_rt_64 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<3>_rt  (
    .I0(\clock/count2 [3]),
    .O(\clock/Madd_count2_addsub0000_cy<3>_rt_62 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<2>_rt  (
    .I0(\clock/count2 [2]),
    .O(\clock/Madd_count2_addsub0000_cy<2>_rt_58 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_cy<1>_rt  (
    .I0(\clock/count2 [1]),
    .O(\clock/Madd_count2_addsub0000_cy<1>_rt_36 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count1_xor<31>_rt  (
    .I0(\clock/count1 [31]),
    .O(\clock/Mcount_count1_xor<31>_rt_265 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Mcount_count0_xor<31>_rt  (
    .I0(\clock/count0 [31]),
    .O(\clock/Mcount_count0_xor<31>_rt_202 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count3_addsub0000_xor<31>_rt  (
    .I0(\clock/count3 [31]),
    .O(\clock/Madd_count3_addsub0000_xor<31>_rt_139 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \clock/Madd_count2_addsub0000_xor<31>_rt  (
    .I0(\clock/count2 [31]),
    .O(\clock/Madd_count2_addsub0000_xor<31>_rt_76 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \clock/count0_cmp_eq0000_wg_cy<7>1  (
    .I0(\clock/count0_cmp_eq0000_wg_lut [7]),
    .I1(\clock/count0_cmp_eq0000_wg_lut [6]),
    .I2(\clock/count0_cmp_eq0000_wg_cy [5]),
    .O(\clock/count0_cmp_eq0000 )
  );
  BUFGP   clock_in_BUFGP (
    .I(clock_in),
    .O(clock_in_BUFGP_657)
  );
  INV   \clock/Mcount_count1_lut<0>_INV_0  (
    .I(\clock/count1 [0]),
    .O(\clock/Mcount_count1_lut [0])
  );
  INV   \clock/Mcount_count0_lut<0>_INV_0  (
    .I(\clock/count0 [0]),
    .O(\clock/Mcount_count0_lut [0])
  );
  INV   \clock/Madd_count3_addsub0000_lut<0>_INV_0  (
    .I(\clock/count3 [0]),
    .O(\clock/Madd_count3_addsub0000_lut [0])
  );
  INV   \clock/Madd_count2_addsub0000_lut<0>_INV_0  (
    .I(\clock/count2 [0]),
    .O(\clock/Madd_count2_addsub0000_lut [0])
  );
  INV   \tff3/qn1_INV_0  (
    .I(\tff3/d_668 ),
    .O(Q2_OBUF_7)
  );
  INV   \tff2/qn1_INV_0  (
    .I(\tff2/d_667 ),
    .O(Q1_OBUF_5)
  );
  INV   \tff1/qn1_INV_0  (
    .I(\tff1/d_666 ),
    .O(Q0_OBUF_3)
  );
  INV   \clock/d_not00031_INV_0  (
    .I(\clock/d_653 ),
    .O(\clock/d_not0003 )
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

