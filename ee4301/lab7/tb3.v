`timescale 1ns / 1ps

module tb3;

	// Inputs
	reg [7:0] c;
	reg start;
	reg clk;
	

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
		
//		
			start = 0;
			#2;
			c = 8'd149;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;


	end
	
	initial begin
		//$monitor( "%d ns: rand = %h", $time, rand);
		$monitor( "%d", rand);
	end
      
endmodule



