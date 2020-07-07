
module  craps ( rb, reset, clk, segment, display);
    
     input rb;
     input reset;
	  
	  output [0:6] s; 	//controls segments of display
	  output [0:2] d; 	//controls characters being displayed

     reg[3:0]  point;			//stores the point

     reg[2:0] state, next_state;

     reg save_point; // set to 1 when the roll should be saved as the point
		
		wire[2:0] l,m,n; //used for counter display mux 
		wire W, L, A;
     // using parameters for state names improves readability and portability
     parameter S0 = 3'd0;  // starts a new game
     parameter SROLL1 = 3'd1;
     parameter SROLL2 = 3'd2;
     parameter SPOINT = 3'd3;
     parameter SWIN = 3'd4;
     parameter SLOSE = 3'd5;

	//*********************Seven Segment display Segment Control*****************************
		assign s[0] = (~n[2]&~n[1]&~n[0]&d[2])|(~n[2]&n[1]&n[0]&d[2])|(W&~d[2])|(L&~d[2]); //a
		assign s[1] = (n[2]&~n[1]&~n[0]&d[2])|(n[2]&~n[1]&n[0]&d[2])|(L&~d[2]);	//b
		assign s[2] = (~n[2]&~n[1]&n[0]&d[2])|(L&~d[2]);	//c
		assign s[3] = (~n[2]&~n[1]&~n[0]&d[2])|(~n[2]&n[1]&n[0]&d[2])|(A&~d[2]);	//d
		assign s[4] = (~n[2]&~n[1]&~n[0]&d[2])|(~n[2]&n[1]&~n[0]&d[2])|(~n[2]&n[1]&n[0]&d[2])|(n[2]&~n[1]&n[0]&d[2]);	//e
		assign s[5] = (~n[2]&~n[1]&~n[0]&d[2])|(~n[2]&~n[1]&n[0]&d[2])|(~n[2]&n[1]&~n[0]&d[2]);	//f
		assign s[6]	= (~n[2]&~n[1]&~n[0]&d[2])|(reset&~d[2])|(W&~d[2])|(L&~d[2]);	//g
		

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
