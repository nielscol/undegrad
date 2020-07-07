// State machine logic to run the dice game

module  dicegame_ctrl ( rb, reset, clk, sum, roll, win, lose );
    
     // check the width of all of these signals
     input rb;
     input reset;
     input clk;
     input [3:0] sum;
     output roll;
     output win;
     output lose;

     // to save the point from the roll after first roll
     reg[3:0]  point;

     reg[2:0] state, next_state;

     reg save_point; // set to 1 when the roll should be saved as the point

     // using parameters for state names improves readability and portability
     parameter S0 = 3'd0;  // starts a new game
     parameter SROLL1 = 3'd1;
     parameter SROLL2 = 3'd2;
     parameter SPOINT = 3'd3;
     parameter SWIN = 3'd4;
     parameter SLOSE = 3'd5;


    // next-state logic based on inputs and current state
    always @(*) // you can always do a combinatorial block with '*' only
    begin
        next_state = S0; // put a default so there is always some assignment
		save_point = 0; // this could be done with an assign, but it's easier here

	case(state)
	    S0: begin
	            if (rb)
			next_state = SROLL1;
	            else
			next_state = S0;
		end

	    SROLL1: begin
	            if (rb)
			next_state = SROLL1;
		    else if (sum==4'd7 | sum==4'd11)
			next_state = SWIN;
		    else if (sum==4'd2 | sum==4'd3 | sum==4'd12)
			next_state = SLOSE;
		    else 
		    begin
			next_state = SPOINT;
			save_point = 1;
		    end
		    end

	    SWIN: begin
					// Fill in next state logic
		   end

	    SLOSE: begin
	            // Fill in next state logic
		   end

	    SPOINT: begin
	            // Fill in next state logic
		end

	    SROLL2: begin
	            // Fill in next state logic
		    end

        endcase
    end





    // output control signals
	 // Fill in logic to base the outputs on current_state
	 // These outputs are functions of current state only
    assign roll = x;
    assign win = x;
    assign lose = x;



    // state vector registers
    always @(posedge clk ) 
    begin 
        if (reset)
	    state <= S0;
	 else
	    state <= next_state;
    end
        
	 
       
    // registers to store the point at the correct time
    always @(posedge clk ) 
    begin 
        if (save_point)
            point <= sum;
				
    end // always
           

endmodule
