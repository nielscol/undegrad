`timescale 1ns / 1ps
module tff ( t, qn, tff_clock, reset );
	input t;
	output qn;
	input tff_clock, reset;
	reg d;
	initial d = 1'b0;
	
	always @ (posedge tff_clock or posedge reset)
		// Execute this process only when the clock changes
		begin
			if (t == 1'b1) begin
			// rising edge of clock and T = 1, so toggle the output 
			d <= ~d;
			end
			if (reset == 1'b1) begin
			d <= 0;
			end
		end //end always
	
assign qn = ~(d); //QN is the inverted value of Q
endmodule