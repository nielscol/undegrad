// Save it as dice_game1.v

module  dicegame1 ( rb, reset, clk, sum, roll, win, lose );
    
    input rb;
    input reset;
    input clk;
    input sum;
    output roll;
    output win;
    output lose;
    integer point;
	 
    wire sp;
    wire eq;
    wire d7;
    wire d711;
    wire d2312;
    wire da;
    wire db;
    wire dc;
    reg a;
    reg b;
    reg c;
    wire roll;
    wire win;
    wire lose;

       
   always @ (posedge clk ) // begin 
               begin 
                   a = da;
                   b = db;
                   c = dc;
                   if ((sp == 1'b1)) 
                       point = sum;
                                      
               end
           
   // end always 

// Edit the code below. Replace the incorrect logical opertors with appropriate equivalents.
Win = B and not C;
Lose = B and C;
Roll = not B and C and Rb;
Sp = not A and not B and C and not Rb and not D711 and not D2312;
D7 = '1' when Sum = 7 else '0';
D711 = '1' when (Sum = 11) or (Sum = 7) else '0';
D2312 = '1' when (Sum = 2) or (Sum = 3) or (Sum = 12) else '0';
Eq = '1' when Point = Sum else '0';
DA = (not A and not B and C and not Rb and not D711 and not D2312) or
	(A and not C) or (A and Rb) or (A and not D7 and not Eq);
DB = ( (not A and not B and C and not Rb) and ( D711 or D2312) ) or
	(B and not Reset) or ( (A and C and not Rb) and (Eq or D7) );
DC = (not B and Rb) or (not A and not B and C and not D711 and D2312) or
	(B and C and not Reset) or (A and C and D7 and not Eq);

endmodule
