`timescale 1ns / 1ps
module tb;

	// Inputs
	reg [7:0] c;
	reg start;
	reg clk;
	
	integer seed = 1;

	// Outputs
	wire [7:0] rand;

	// Instantiate the Unit Under Test (UUT)
	rng uut (
		.rand(rand), 
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
		
		c = seed;
		start = 1;
		
		#510;
//		
		forever begin
			start = 0;
			
			#2;
			
			seed = seed + 1;
			c = seed;
			
			start = 1;
			
			#510;
		end
        
		// Add stimulus here

	end
	
	initial begin
		//$monitor( "%d ns: rand = %h", $time, rand);
		$monitor( "%d", rand);
	end
      
endmodule

