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
			c = 8'd129;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;
//
			start = 0;
			#2;
			c = 8'd130;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;     
//
			start = 0;
			#2;
			c = 8'd132;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
//
			start = 0;
			#2;
			c = 8'd135;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd136;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   

//
			start = 0;
			#2;
			c = 8'd139;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd141;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  

//
			start = 0;
			#2;
			c = 8'd142;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd144;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd147;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
//
			start = 0;
			#2;
			c = 8'd149;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd150;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd153;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd154;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  

//
			start = 0;
			#2;
			c = 8'd156;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;

//
			start = 0;
			#2;
			c = 8'd159;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd160;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd163;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd165;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  	
//
			start = 0;
			#2;
			c = 8'd166;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  

//
			start = 0;
			#2;
			c = 8'd169;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd170;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;    
//
			start = 0;
			#2;
			c = 8'd172;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd175;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 	  
//
			start = 0;
			#2;
			c = 8'd177;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd178;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 	  
//
			start = 0;
			#2;
			c = 8'd180;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd183;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd184;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 	
  
//
			start = 0;
			#2;
			c = 8'd187;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd189;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd190;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd192;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd195;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd197;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd198;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd201;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd202;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd204;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd207;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd209;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd210;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd212;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd215;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd216;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd219;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd221;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd232;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd235;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
//
			start = 0;
			#2;
			c = 8'd237;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;  
  
//
			start = 0;
			#2;
			c = 8'd238;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd240;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd243;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd245;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;
  
//
			start = 0;
			#2;
			c = 8'd246;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510;   
//
			start = 0;
			#2;
			c = 8'd249;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 
  
//
			start = 0;
			#2;
			c = 8'd250;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 	
  
//
			start = 0;
			#2;
			c = 8'd252;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 	  
//
			start = 0;
			#2;
			c = 8'd255;
			$display("BREAK!!!!! c = %d", c);
			start = 1;
			
			#510; 			

	end
	
	initial begin
		//$monitor( "%d ns: rand = %h", $time, rand);
		$monitor( "%d", rand);
	end
      
endmodule



