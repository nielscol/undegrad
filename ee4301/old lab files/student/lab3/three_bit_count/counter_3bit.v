`timescale 1ns / 1ps

module counter_3bit (rst_in, clock_in, Q0, Q1, Q2 );
	input clock_in, rst_in;
	output Q0;
	output Q1;
	output Q2;
// Why do we need them???
	wire all_t;
	wire s0;
	wire s1;
	wire s2;
	wire mainclock;
	clock_divider clock(.cin(clock_in), .cout(mainclock));
	tff tff1(.t(1'b1), .qn(s0), .tff_clock(mainclock), .reset(rst_in));
	tff tff2(.t(1'b1), .qn(s1), .tff_clock(s0), .reset(rst_in));
	tff tff3(.t(1'b1), .qn(s2), .tff_clock(s1), .reset(rst_in));
	
	assign {Q0}= ~s0;
	assign {Q1}= ~s1;
	assign {Q2}= ~s2;
endmodule

