`timescale 1ns / 1ps

module seven_seg(la,lb,lc,ld,le,lf,lg, clock_in, rst);
	output la,lb,lc,ld,le,lf,lg;
	wire Q2, Q1, Q0;
	input clock_in, rst;
	
	counter_3bit count(rst, clock_in, Q0, Q1, Q2);
 
	assign lg = (~Q2&~Q1&~Q0)|(~Q2&~Q1&Q0)|(Q2&Q1&Q0);
	assign lf = (~Q2&~Q1&Q0)|(~Q2&Q1&~Q0)|(~Q2&Q1&Q0)|(Q2&Q1&Q0);
	assign le = (~Q2&~Q1&Q0)|(~Q2&Q1&Q0)|(Q2&~Q1&~Q0)|(Q2&~Q1&Q0)|(Q2&Q1&Q0);
	assign ld = (~Q2&~Q1&Q0)|(Q2&~Q1&~Q0)|(Q2&Q1&Q0);
	assign lc = (~Q2&Q1&~Q0);
	assign lb = (Q2&~Q1&Q0)|(Q2&Q1&~Q0);
	assign la = (~Q2&~Q1&Q0)|(Q2&~Q1&~Q0);

endmodule
