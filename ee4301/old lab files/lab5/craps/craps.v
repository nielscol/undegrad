
`timescale 1ns / 1ps

module  craps ( rb, reset, clk, s, d, test);

	input rb;
	input reset;
	input clk;

	output reg [6:0] s; //controls display segments
	output reg [3:0] d; //controls display characters

	output test;

	reg[3:0] sum,  point; //stores point (sum of roll)

	reg[2:0] state = 3'd0;
	reg[2:0] next_state;

	wire mclk, fclk, sclk;
	wire[2:0] dice1, dice2;

	reg roll = 1'b0;
	reg A = 1'b1;
	reg L = 1'b0;
	reg W = 1'b0;

	assign test = roll;
	
	clock_divider main_clock(clk, mclk);
	fclock_divider fast_clock(clk, fclk);
	sclock_divider slow_clock(clk, sclk);
	
	dice dice_1(dice1, roll, fclk, reset);
	dice dice_2(dice2, roll, sclk, reset);
	
	// using parameters for state names improves readability and portability
	parameter S0 = 3'd0;  		// starts a new game, waits for roll
	parameter SROLL1 = 3'd1;	//starts rolling if rb pressed,
	parameter SLOSE = 3'd2;	
	parameter SWIN = 3'd3;
	parameter SHOLD = 3'd4;		//shows values if not win/lose, waits for roll
	parameter SROLL2 = 3'd5;	//reroll
	parameter SRST = 3'd6;		//shows ZERO, goes to S0


    always @(*) // you can always do a combinatorial block with '*' only
    begin
		case(state)
		 S0:	begin
		 			{A,L,W,roll} = 4'b1000;
					if (rb)
						next_state = SROLL1;
					else
						next_state = S0;
				end
	    SROLL1: 
				begin
					{A,L,W} = 3'b100;
					roll = 1;
					if (~rb)
						begin
							roll = 0;
							point = dice1 + dice2;
							if ((point == 4'd7)|(point == 4'd11))
								next_state = SWIN;
							else if ((point == 4'd2)|(point == 4'd3)|(point == 4'd12))
								next_state = SLOSE;
							else 
								next_state = SHOLD;
						end
					else
						next_state = SROLL1;
				end

	    SHOLD: begin
					if (rb)
						next_state = SROLL2;
					else 
						next_state = SHOLD;
				end

	    SWIN:   begin
					{A,L,W} = 3'b001;
					next_state = SWIN;
				end

	    SLOSE:  begin
					{A,L,W} = 3'b010;
					next_state = SLOSE;
				end

	    SROLL2: begin
		 			{A,L,W} = 3'b100;
					roll = 1;
					if (~rb)
						begin
							roll = 0;
							sum = dice1 + dice2;
							if (point == sum)
								next_state = SWIN;
							else if (sum == 4'd7)
								next_state = SLOSE;
							else 
								next_state = SHOLD;
						end
					else
						next_state = SROLL2;
				end
			
	    SRST: begin
				{A,L,W} = 3'b000;
				if(~reset)
					begin	
						next_state = S0;
						{A,L,W} = 3'b100;
					end
				else
					next_state = SRST;
		    end
        endcase
    end

	//updates display
	always @(mclk)
	begin
			if(d[0]==0) //if displaying status char
				begin
					casex({A,L,W,reset})
						4'b1000: s = 7'b0001000; //show A
						4'b0100: s = 7'b1110001; //show L
						4'b0010: s = 7'b1000001; //show W (U)
						4'bxxx1: s = 7'b0000001; //show 0
						default: s = 7'b0001000; 
					 endcase
				end
			else if(d[1] == 0) //dice 1
				begin 
					case(dice1)
						3'b001: s = 7'b1001111;
						3'b010: s = 7'b0010010;
						3'b011: s = 7'b0000110;
						3'b100: s = 7'b1001100;
						3'b101: s = 7'b0100100;
						3'b110: s = 7'b0100000;
					endcase
				end
			else if(d[2] == 0) //dice 2
				begin 
					case(dice2)
						3'b001: s = 7'b1001111;
						3'b010: s = 7'b0010010;
						3'b011: s = 7'b0000110;
						3'b100: s = 7'b1001100;
						3'b101: s = 7'b0100100;
						3'b110: s = 7'b0100000;
					endcase
				end		
	end
		
	always @ (posedge mclk)
	begin
			if(~d[0])
				d = 4'b1011;
			else if(~d[1])
				d = 4'b1110;
			else if(~d[2])
				d = 4'b1101;
	end


    // state vector registers
    always @(posedge mclk) 
    begin 
      if (reset)
			state <= SRST;
		else
			state <= next_state;
    end
        
	 
           

endmodule