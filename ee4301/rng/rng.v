`timescale 1ns / 1ps

module rng(rand, c, start, clk);

	output [7:0] rand;
	input [7:0] c;
	input start, clk;
	wire [7:0] w;
	
	assign w[0] = (c[0]&rand[0])^w[1];
	assign w[1] = (c[1]&rand[0])^w[2];
	assign w[2] = (c[2]&rand[0])^w[3];
	assign w[3] = (c[3]&rand[0])^w[4];
	assign w[4] = (c[4]&rand[0])^w[5];
	assign w[5] = (c[5]&rand[0])^w[6];
	assign w[6] = (c[6]&rand[0])^w[7];
	assign w[7] = (c[7]&rand[7]);
	
	dff dff0(.D(w[0]),.Q(rand[0]), .clk(clk), .start(start));
	dff dff1(.D(rand[0]),.Q(rand[1]), .clk(clk), .start(start));
	dff dff2(.D(rand[1]),.Q(rand[2]), .clk(clk), .start(start));
	dff dff3(.D(rand[2]),.Q(rand[3]), .clk(clk), .start(start));
	dff dff4(.D(rand[3]),.Q(rand[4]), .clk(clk), .start(start));
	dff dff5(.D(rand[4]),.Q(rand[5]), .clk(clk), .start(start));
	dff dff6(.D(rand[5]),.Q(rand[6]), .clk(clk), .start(start));
	dff dff7(.D(rand[6]),.Q(rand[7]), .clk(clk), .start(start));


endmodule
