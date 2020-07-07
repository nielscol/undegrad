// Verilog model of a 4-bit ripple carry adder
// Uses the module full_adder.v
module fourbit_addsub(
	output [3:0] s,
	output cout,
	input [3:0] a,
	input [3:0] b,
	input sub
	);
	
	wire [3:0] bxor;
	wire [3:1] carry;
	
	xor G0(bxor[0],b[0],sub);
	full_adder FA0(.sum(s[0]),.cout(carry[1]),
		.ain(a[0]),.bin(bxor[0]),.cin(sub));
	xor G1(bxor[1],b[1],sub);
	full_adder FA1(.sum(s[1]),.cout(carry[2]),
		.ain(a[1]),.bin(bxor[1]),.cin(carry[1]));
	xor G2(bxor[2],b[2],sub);
	full_adder FA2(.sum(s[2]),.cout(carry[3]),
		.ain(a[2]),.bin(bxor[2]),.cin(carry[2]));
	xor G3(bxor[3],b[3],sub);
	full_adder FA3(.sum(s[3]),.cout(cout),
		.ain(a[3]),.bin(bxor[3]),.cin(carry[3]));
		
endmodule
