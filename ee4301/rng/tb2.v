`timescale 1ns / 1ps
module tb2;

	// Inputs
	reg [7:0] c;
	reg start;
	reg clk;
	
	int i = 0;
	int seed [63:0] ='{8'd129,
									8'd130,
									8'd132,
									8'd135,
									8'd136,
									8'd139,
									8'd141,
									8'd142,
									8'd144,
									8'd147,
									8'd149,
									8'd150,
									8'd153,
									8'd154,
									8'd156,
									8'd159,
									8'd160,
									8'd163,
									8'd165,
									8'd166,
									8'd169,
									8'd170,
									8'd172,
									8'd175,
									8'd177,
									8'd178,
									8'd180,
									8'd183,
									8'd184,
									8'd187,
									8'd189,
									8'd190,
									8'd192,
									8'd195,
									8'd197,
									8'd198,
									8'd201,
									8'd202,
									8'd204,
									8'd207,
									8'd209,
									8'd210,
									8'd212,
									8'd215,
									8'd216,
									8'd219,
									8'd221,
									8'd222,
									8'd225,
									8'd226,
									8'd228,
									8'd231,
									8'd232,
									8'd235,
									8'd237,
									8'd238,
									8'd240,
									8'd243,
									8'd245,
									8'd246,
									8'd249,
									8'd250,
									8'd252,
									8'd255};

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
		$display("hi")
		forever begin
			start = 0;
			
			#2;
			
			c = seed[i];
			i = i + 1;
			
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

