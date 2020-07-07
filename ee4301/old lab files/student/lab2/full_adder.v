// Verilog model of a full adder
module full_adder(
	output sum,
	output cout,
	input ain,
	input bin,
	input cin
	);
	
	assign sum = ain^bin^cin;
	assign cout= (ain&bin)|(ain&cin)|(bin&cin);
	
endmodule
