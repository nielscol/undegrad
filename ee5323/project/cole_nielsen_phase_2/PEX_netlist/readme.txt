===================Delay distribution test=======================

You will need the following input files:
1. adder16b.sp 
: You must follow the input output naming convention in the project assignment document)
2. digital_vector_delay
3. testadder16b.sp
4. runtestadder_delay.sp
5. TestAdderDelay.py 
: You will have to change 3 parameters; input frequency (=test vector switching frequency), temperature, and POST_option (=whether to generate .tr0 file or not)

Run testbech command: 
python TestAdderDelay.py 
:Before running this testbech, you should first verify the adder functionality using 'runtestadder_delay.sp'

Two ouput files will be generated:
1. OutputDelay.txt 
: column 1~3: input A, input B, output
: column 4~20: Cout, S15~S0
: column 21: maximum delay for each test vector
2. MaxDelay.txt
:  maximum delay for each test vector

================== Power measurements=========================

You will need the following input files:

1. adder16b.sp 
: Again, input ouput signals must be named according to the naming convention in the project document
2. digital_vector_power
3. testadder16b.sp
4. runtestadder_power.sp 
: Carefully read the comments in this file

Then run 'runtestadder_delay.sp' using hspice.
