`timescale 1ns / 1ps

module display(s, d, sw, c, clk);
	output reg [7:0] s;	//segments
	output reg [3:0] d = 4'b1110;	//cathodes
	input	[7:0]	sw;	//segment signal
	input [3:0] c; 	//control signal 3 - mod 2 - write 1 - reset 0 - nothing
	input clk;
	
	wire sclk;
	
	parameter sscroll = 2'd0;
	parameter smod = 2'd1;
	parameter sstore = 2'd2;
	parameter sreset = 2'd3;
	
	reg [1:0] state = 2'd0;
	reg [7:0] text [0:22];
	integer digits = 0;
	integer i;
	integer j = 0;
	integer k,l,m;
	
	s_clock_divider s_clk (.cin(clk), .cout(sclk));
	
	always @(posedge c[2] or posedge c[1]) //
	begin
		if(c[3] & (digits < 20)) 
		begin
			text[digits] = sw;
			digits <= digits + 1;
		end
		if(c[1])
		begin
			for (i = 0; i <= 22; i = i+1)
				text[i] <= 8'hFF;	
		end
	end
		
	always @(*)
	begin
		case(state)
			sscroll:	
				begin
					if(c[3]) next_state = smod; //modify char
					else next_state = sscroll;
				end
			smod: //store char
				begin
					if(c[3]) next_state = smod;
					else if (c[3]&c[2]) next_state = sstore;
					else next_state = sscroll;
				end			
			sstore: //reset
				begin
					if (c[3]&c[2]) next_state = sstore;
					else next_state = sscroll;
				end			
			sreset: 
			begin
				if(~c[1]) next_state = sscroll;	
				j = 0;
				digits = 0;
			end
			default: next_state = sscroll;
		endcase
	end		
		
	
		
		
	always @(posedge clk)
	begin
		if(c[1]) state = sreset;
		else state = next_state;

	end
	
	always @ (posedge sclk)
	begin
		d <= {d[2:0],d[3]};
		if (digits == 0)
		begin
			j <= 0;
			k <= 1;
			l <= 2;
			m <= 3;
		end
		else 
		begin
			if (j == 0) j <= digits+2;
			else j <= j - 1;
			if {k == 0) k <= digits+2;
			else k <= j+1;
			if (l == 0) l <= digits+2;
			else l <= j+2;
			if (m == 0) m <= digits+2;
			else m <= j+3;
		end
	end
	
	always @ (*)
	begin
		if(~d[0])
		begin
			if(c == 4'b1000) s = 8'b10001111;
			else if(c = 4'b1100) s = 8'b11000101;
			else s = text[m]
		end
		else if (~d[1]);
		begin
			if (c[3]) s = 8'hFF;
			else s = text[l];
		end
		else if (~d[2]);
		begin
			if(c[3]) s = 8'hFF;
			else s = text[k];
		end
		else if {~d[3]);
		begin
			if (c[3]) s = sw;
			else s = text[j];
		end
	end
	

endmodule
