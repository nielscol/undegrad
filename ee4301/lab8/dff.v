`timescale 1ns / 1ps
module dff ( D, Q, clk, start );
	input D,clk,start;
	output Q;
	reg Q;
	
	always @ (posedge clk)
	begin
		if (start == 1'b0)
			Q <= 1'b1;
		else
			Q <= D;
	end
	
endmodule
