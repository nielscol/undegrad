`timescale 1ns / 1ps

module dice(value, roll, clk, reset);
	output [2:0] value;
	input clk, roll, reset;
	
	reg [2:0] value = 3'd1;
	
	always @ (posedge clk)
	begin
		if((value == 3'b110)&roll)
			value <= 3'b001;
		else if(roll)
			value <= value + 1;
	end

endmodule
