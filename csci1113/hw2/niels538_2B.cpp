// Cole Nielsen 10.1.2014
// CSci 1113 HW 2B Better pi approximation
// niels538
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	double arctan(double a,int n);
	const double A = 1.0/5.0; // A and B are the integer values used in the arctangent approximation of pi
	const double B = 1.0/239.0;

	cout.setf(ios::fixed); //sets cout to twelve decimal precision for floats
	cout.setf(ios::showpoint);
	cout.precision(12);
		
	for (int n=1; n<=9; n++) //evaluates the pi approximation using 1 to 9 terms of the arctangent approximation 
	{
		cout << "The pi estimate from the " << n << " term series is ";
		cout << 16.0*arctan(A,n) - 4.0*arctan(B,n) << endl;
	}
	return 0;
}

double arctan(double a, int n) //function to perform the approximation for arctangent of a using n number of terms of
{				//the eviquelent series approx. for arctangent
	double sum = 0;
	n = 1 + 2*n;
	for (int j=1, k=1 ; j<=n; j+=2, k*= -1)
		sum += k*(pow(a,j)/j);
	return sum; 		//returns the approximated arctangent value to whatever called it.
}	
