// Cole Nielsen 11.7.14
// CSci 1113 HW 4C
// niels538@umn.edu
#include <iostream>
using namespace std;

double bam(double b, int e);
	//function the finds b^e using recursion

int main()
{
	double b;
	int e;
	char a = 'y';
	
	while (a == 'y') //continuation loop
	{
		cout << "Please enter the base b and the exponent e: "; //prompts for base and exponent
		cin >> b >> e; 						//stores to b and e respectively

		cout << "b to the e power is " << bam(b, e) << endl;    //outputs b^e using the bam function

		cout << "Do another computation? (y/n) "; //asks if user wants to continue 
		cin >> a;   //response (y/n) is stored and the loop will continues or terminate accordingly 
	}

	return 0;
}

double bam(double b, int e)
{
	if (e == 0)	    //base case if exponent is 0
		return 1;
	else if(e == 1)	    //base case if exponent is 1
		return b;
	else if ((e % 2) == 0)  //if exponent is even (but not a base case), a recursive
	{			//call is made to find b^e follwing that b^e = (b^(e/2))^2
		double r;
		r =  bam(b, e/2);
		return r*r;
	}
	else 				  //alternatively if e is odd, then a recursive call
		return (bam(b, e-1) * b); //is made to find b^e following that b^e = (b^(e-1))*b
}
