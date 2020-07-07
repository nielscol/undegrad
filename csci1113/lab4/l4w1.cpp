#include <iostream>
#include <cmath>
using namespace std;

double babylonianRoot (double n)
{
	double old_guess, new_guess, r=1;
	old_guess = n/2.0;

	while (r > 0.01)
		{
		new_guess = ( old_guess + ( n / old_guess))/2.0;
		r = fabs(1.0 - (new_guess/old_guess));
		old_guess = new_guess;
		}
	return new_guess;
}


int main()
{
	int n;

	cout << "Enter number: ";
	cin >> n;
	cout << "Square root = " << babylonianRoot(n) << endl;

	return 0;
}
