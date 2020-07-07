`timescale 1ns / 1ps

module tb4;

	// Inputs
	reg [7:0] c;
	reg start;
	reg clk;
	
	integer seed = 0;
	integer i = 0;
	integer j = 0;
	integer k = 0;
	integer l = 0;
	integer first;
	
	// Outputs
	wire [7:0] randn;

	// Instantiate the Unit Under Test (UUT)
	rng uut (
		.randn(randn), 
		.c(c), 
		.start(start), 
		.clk(clk)
	);
	initial begin
		clk= 0;
		
		forever #1 clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		start = 0;
		// Wait 100 ns for global reset to finish
		#100;
//		
		forever begin
			start = 0;
			
			#4;
			seed = seed + 1;
			c = seed;
			//$display("BREAK!!!!! c = %d", c);
			
			start = 1;
			#500;
			i = 1;
			#2
			l = 1;
			#506;
			j = 1;
			#10;

		end
	end
		
		always @(*)
		begin
			if(i == 1)
			begin
				i = 0;
				first = randn;
			end
			if((randn == first)&(l == 1))
				k = 1;
			if((j == 1)&(k == 0))
			begin
				$display("good seed c = %d$", c);
				j = 0;
				l = 0;
			end
			if((j == 1)&(k==1))
			begin
				k = 0;
				j = 0;
				l = 0;
			end
		end
      
endmodule
