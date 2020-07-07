`timescale 1ns / 1ps

module rng(d, s, c, start, clk);

	output reg [3:0] d; 
	output reg [6:0] s;
	input [7:0] c;
	input start, clk;
	wire [7:0] rand;
	wire [7:0] w;
	wire mclk, sclk;
	
	
	clock_divider main_clk(clk, mclk);
	s_clock_divider slow_clk(clk, sclk);
	
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
	
	always @(posedge mclk) //cycles through display characters
	begin
		case(d)
			4'b1110: d = 4'b1101;
			4'b1101: d = 4'b1110;
			default: d = 4'b1110;
		endcase	
	end
	
	always @(posedge clk)
	begin
		if(d[0] == 0)
			case(rand[7:4])
				4'd0 : s = 7'b0000001;
				4'd1 : s = 7'b1001111;
				4'd2 : s = 7'b0010010;
				4'd3 : s = 7'b0000110;
				4'd4 : s = 7'b1001100;
				4'd5 : s = 7'b0100100;
				4'd6 : s = 7'b0100000;
				4'd7 : s = 7'b0001111;
				4'd8 : s = 7'b0000000;
				4'd9 : s = 7'b0001100;
				4'd10: s = 7'b0001000;
				4'd11: s = 7'b1100000;
				4'd12: s = 7'b0110001;
				4'd13: s = 7'b1000010;
				4'd14: s = 7'b0110000;
				4'd15: s = 7'b0111000;
			endcase
		if(d[1] == 0)
			case(rand[3:0])
				4'd0 : s = 7'b0000001;
				4'd1 : s = 7'b1001111;
				4'd2 : s = 7'b0010010;
				4'd3 : s = 7'b0000110;
				4'd4 : s = 7'b1001100;
				4'd5 : s = 7'b0100100;
				4'd6 : s = 7'b0100000;
				4'd7 : s = 7'b0001111;
				4'd8 : s = 7'b0000000;
				4'd9 : s = 7'b0001100;
				4'd10: s = 7'b0001000;
				4'd11: s = 7'b1100000;
				4'd12: s = 7'b0110001;
				4'd13: s = 7'b1000010;
				4'd14: s = 7'b0110000;
				4'd15: s = 7'b0111000;
			endcase
	end

endmodule
