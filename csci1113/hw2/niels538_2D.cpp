// Cole Niesen 10.2.2014
// CSci 1113 HW 2D
// niels538@umn.edu
#include <iostream>
using namespace std;

double int_approx(double a, double b, int n) //function that performs the approximation of the integral
{
	double sum=0, x;
	double functionx(double p); 

	x = (b-a)/(n-1.0); //calculates difference in x between each sample point
	for (int i = a; i <= b; i +=x) //loop sums the each value of the function at n number of 
		sum += functionx(i);   //points on the function on [a,b] with even x distance between points
	return ((b-a)*(sum/n)); // multiplies difference in range times the average of the sample points
}

double functionx(double p) // this function returns the value of f(x) at a requested point 
{
	p = p*p;
	return p;
}

int main()
{
	int n;
	double a, b;
	char c = 'y';

	cout.setf(ios::fixed); //sets output precision to 4 decimal places
	cout.setf(ios::showpoint);
	cout.precision(4);

	while (c == 'y') //loop that keeps doing approximations as long as the user want
	{
		cout << "Input the interval endpoints: "; //prompts user to input desired values
		cin >> a >> b;
		cout << "Input the number of function samples: ";

		cin >> n;
		cout << "Integral estimate: "; //outputs the approximation
		cout << int_approx(a, b, n) << endl;
		cout << "Do you want another estimate (y/n)? "; //asks if user wants to keep approximating
		cin >> c;  //if so, user enters 'y' and the loop executes again
	}

	return 0;
}

