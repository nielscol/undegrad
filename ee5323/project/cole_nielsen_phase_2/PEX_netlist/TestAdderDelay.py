##===========This is used to generate random vectors and test the delay distribution==============##

import os
import random
import re

##==========Global Parameters==========##
Input_Freq=str(2.00) #unit 1ns
temperature=110	# degree
POST_option=True  # Select post option


##==========Read digital vector==========##
def rd_DigitalVector( my_filename):
	lookup="; tabular data section"
	VectorFile = open(my_filename,'r')
	for num, line in enumerate(VectorFile,1):
		if lookup in line:
			line_num=int(num)
	VectorFile.close()
	VectorFile = open(my_filename,'r')
	file_list = VectorFile.readlines()
	VectorFile.close()

	file_list_new = file_list[0:line_num]
	return file_list_new
	return
##==========End function=====================##

##==========Generate new digital vector==========##
def wr_DigitalVector( file_list_new, input_a_hex_0, input_a_hex_1, input_b_hex_0, input_b_hex_1 ):
	file_list_new.append ('0.0  '+ input_a_hex_0+ ' '+ input_b_hex_0 + '\n')
	file_list_new.append (Input_Freq+'  '+ input_a_hex_1+ ' '+ input_b_hex_1 + '\n')
	Vector_NewFile = open ('digital_vector_delay_new', 'w')
	Vector_NewFile.writelines(file_list_new)
	Vector_NewFile.close()
	return
##==========End function=====================##

##==========Generate new runtestadder16b_delay file==========##
def rd_Runtest_delay( my_filename):

	lookup0=".VEC"
	lookup1="* YOU SHOULD MAKE SURE THAT YOU ARE MEASURING THE CORRECT SIGNAL FOR MAXIMUM DELAY. BELOW IS JUST AN EXAMPLE."
	lookup2=".OPTIONS POST=2"
	lookup3=".TEMP"
	RunTestFile = open(my_filename,'r')
	for num, line in enumerate(RunTestFile,1):
		if lookup1 in line:
			line_num1=int(num)
		elif lookup0 in line:
			line_num0=int(num)
		elif lookup2 in line:
			line_num2=int(num)
		elif lookup3 in line:
			line_num3=int(num)
	RunTestFile.close()

	RunTestFile = open(my_filename,'r')
	file_list = RunTestFile.readlines()
	RunTestFile.close()

	file_list[line_num0-1]=".VEC 'digital_vector_delay_new'"+'\n'
	if POST_option == False:
		file_list[line_num2-1]= '\n'
	file_list[line_num3-1]=".TEMP "+str(temperature)+'\n'
	file_list_new = file_list[0:line_num1]
	return file_list_new
##==========End function=====================##

##==========Generate new runtestadder16b_delay file==========##
def wr_Runtest_delay( file_list_new, Bitwise_transition ):
	# Cout
	if bool(int(Bitwise_transition[0])):
		file_list_new.append('.MEASURE TRAN DELAY_Cout TRIG AT='+Input_Freq+'n TD='+Input_Freq+'n TARG V(Cout) VAL= 0.55 CROSS=1'+'\n')
	# S15~S0
	for i in range(1,len(Bitwise_transition)):
		if bool(int(Bitwise_transition[i])):
			file_list_new.append ('.MEASURE TRAN DELAY_S_'+str(16-i) + ' TRIG AT='+Input_Freq+'n TD='+Input_Freq+'n TARG V(S_' + str(16-i)+') VAL= 0.55 CROSS=1'+'\n')
	file_list_new.append ('\n' + '.END' + '\n')

	RunTest_NewFile = open ('runtestadder16b_delay_new.sp', 'w')
	RunTest_NewFile.writelines(file_list_new)
	RunTest_NewFile.close()
	return
##==========End function=====================##

##==========Extract Delay information ==========##
def my_DelayExtraction( my_filename, Bitwise_transition ):
	lookup="alter#"

	mt0_fi = open(my_filename,'r')
	for num, line in enumerate(mt0_fi,1):
		if lookup in line:
			line_num=int(num)
	mt0_fi.close()
	mt0_fi = open(my_filename,'r')
	file_list = mt0_fi.readlines()
	mt0_fi.close()

	MeasDelays = file_list[line_num].split()
	Max_Delay = 0
	Bitwise_Delay = ""
	k=0
		
	for i in range(len(Bitwise_transition)):
		if bool(int(Bitwise_transition[i])):
			Bitwise_Delay =  Bitwise_Delay+str(MeasDelays[k])+'\t'
			if float(MeasDelays[k]) > Max_Delay:
				Max_Delay=float(MeasDelays[k])
			k=k+1
		else:
			Bitwise_Delay = Bitwise_Delay+'0'+'\t'
	Bitwise_Delay = Bitwise_Delay+str(Max_Delay)+'\n'
		

	return (Bitwise_Delay,Max_Delay)
##==========End function=====================##


#=========== Generate a 1000 test vector ============#

#Initialize
output_array_hex = [] # output c in hexadecimal 
output_array_bin = [] # output c in binary
input_a_array_hex = [] # adder input a 
input_b_array_hex = [] # adder input b
output_transition_array=[]
output_info_array=[]
MaxDelay_list=[]

#generate random adder output
OutputRange = pow(2,17)
output_array = random.sample(range(OutputRange),1001)

file_list_vector=rd_DigitalVector('digital_vector_delay')
file_list_RunTest=rd_Runtest_delay( 'runtestadder16b_delay.sp')

for i in range(10):
	# generate input vector a & b, max(0,c-2^16+1) < a,b < min(c,2^16-1)
	input_a = random.randint(max(0,output_array[i]-pow(2,16)+1),min(output_array[i],pow(2,16)-1))
	input_b = output_array[i]-input_a

	input_a_array_hex.append(format(input_a,'04X'))
	input_b_array_hex.append(format(input_b,'04X'))
	output_array_hex.append(format(output_array[i],'05X'))
	output_array_bin.append(format(output_array[i],'017b'))

	# detect transition on the output
	if i != 0:
		# generate new digital vector
		file_list_wr=file_list_vector[:]
		wr_DigitalVector( file_list_wr,input_a_array_hex[i-1],  input_a_array_hex[i], input_b_array_hex[i-1], input_b_array_hex[i] )

		# Xor output(T) and output(2T), if there's a transition, output_transition[i]=1
		output_transition = output_array[i]^output_array[i-1]
		output_transition_array.append(format(output_transition,'017b'))
		Bitwise_transition=list(output_transition_array[i-1])
		# generate new runtest file
		file_list_wr=file_list_RunTest[:]
		wr_Runtest_delay( file_list_wr, Bitwise_transition )
		##===========Simulation with Hspice===========##
		os.system('hspice runtestadder16b_delay_new.sp > runout')
		print(i)
		Bitwise_Delay, MaxDelay = my_DelayExtraction('runtestadder16b_delay_new.mt0',Bitwise_transition)
		output_line = input_a_array_hex[i]+'\t'+input_b_array_hex[i]+'\t'+output_array_hex[i]+'\t'+Bitwise_Delay
		output_info_array.append(output_line)
		MaxDelay_list.append(str(MaxDelay)+'\n')

OutFile = open ('OutputDelay.txt','w') #output file
OutFile.writelines(output_info_array)
OutFile.close()

OutFile = open ('MaxDelay.txt','w') #output file
OutFile.writelines(MaxDelay_list)
OutFile.close()


