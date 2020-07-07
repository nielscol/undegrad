#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	double new_guess, old_guess, n, r=1;

	cout << "Enter number: ";

	cin >> n;
	old_guess = n/2.0;

	while (r > 0.01)
		{
		new_guess = ( old_guess + ( n / old_guess ) )/2.0;
		r = fabs(1.0 - (new_guess/old_guess));
		old_guess = new_guess;
		}

	cout << "Square root= " << new_guess << endl;

	return 0;
}
