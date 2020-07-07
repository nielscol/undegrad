`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:01:25 09/11/2015
// Design Name:   fourbit_addsub
// Module Name:   Z:/lab1_adder_verilog/tb.v
// Project Name:  lab1_adder_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fourbit_addsub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg sub;

	// Outputs
	wire [3:0] s;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	fourbit_addsub uut (
		.s(s), 
		.cout(cout), 
		.a(a), 
		.b(b), 
		.sub(sub)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		sub = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 4'b0011;
		b = 4'b0010;
		
		#100; // this line causes simulation to advance 100ns
		
		a = 4'b1100;
		b = 4'b0101;
		sub = 1;
		
		#100;

		a = 4'b0011;
		b = 4'b0101;

		#100;
		
		// continue with more stimulus, choose different values for the inputs

	end
      
endmodule

