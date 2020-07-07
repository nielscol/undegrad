// Cole Nielsen 10.1.2014
// CSci 1113 HW 2A
// niels538
#include <iostream>
using namespace std;


int main()
{
	double arctan(double a);
	const double A = 1.0/5.0;
	const double B = 1.0/239.0;

	cout.setf(ios::fixed); //sets the precision of floating point values displayed by cout to 12
	cout.setf(ios::showpoint);
	cout.precision(12);
	
	cout << "The pi estimate from the 3 term series is "; 
	cout << 16.0*arctan(A) - 4.0*arctan(B) << endl; // calculates aand displays the approximation for pi

	return 0;
}

double arctan(double a) //function to find the approximation for secant using a partial series approximation.
{
	a = a - ((a*a*a)/3.0) + ((a*a*a*a*a)/5.0);
	return a; //returns the result to the whatever calls it
}	
