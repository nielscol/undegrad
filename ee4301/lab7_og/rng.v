`timescale 1ns / 1ps
module rng(randn, c, start, clk);

	input [7:0] c;
	input start, clk;
	wire [7:0] rand;
	output [7:0] randn ;
	wire [7:0] w;
	
	assign randn = rand;
	
	assign w[0] = (c[0]&rand[0])^w[1];
	assign w[1] = (c[1]&rand[1])^w[2];
	assign w[2] = (c[2]&rand[2])^w[3];
	assign w[3] = (c[3]&rand[3])^w[4];
	assign w[4] = (c[4]&rand[4])^w[5];
	assign w[5] = (c[5]&rand[5])^w[6];
	assign w[6] = (c[6]&rand[6])^w[7];
	assign w[7] = (c[7]&rand[7]);
	
	dff dff0(.D(w[0]),.Q(rand[0]), .clk(sclk), .start(start));
	dff dff1(.D(rand[0]),.Q(rand[1]), .clk(sclk), .start(start));
	dff dff2(.D(rand[1]),.Q(rand[2]), .clk(sclk), .start(start));
	dff dff3(.D(rand[2]),.Q(rand[3]), .clk(sclk), .start(start));
	dff dff4(.D(rand[3]),.Q(rand[4]), .clk(sclk), .start(start));
	dff dff5(.D(rand[4]),.Q(rand[5]), .clk(sclk), .start(start));
	dff dff6(.D(rand[5]),.Q(rand[6]), .clk(sclk), .start(start));
	dff dff7(.D(rand[6]),.Q(rand[7]), .clk(sclk), .start(start));
	

endmodule
