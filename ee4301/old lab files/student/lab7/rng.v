`timescale 1ns / 1ps


module rng(rand, c, clk, start);
	input [7:0] c;
	input clk;
	input start;
	
	wire [7:0] rand, fb;
	
	/*integer i;
	
	for(i=7, i >= 0, i= i-1)
	begin
			dff 
	end*/
		
	genvar i;
	
	dff dff_0(fb[0], rand[0], clk, start);
	
	generate for (i = 1; i <= 7; i = i + 1) begin
		 dff instance(rand[i-1], rand[i], clk, start);
		 assign fb[i-1] = (c[i-1]&rand[i-1])^fb[i];
	end endgenerate
	
	fb[7] = c[7]&rand[7];

endmodule
