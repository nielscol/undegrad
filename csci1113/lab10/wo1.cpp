#include <iostream>
#include "poly.h"
using namespace std;

int main()
{
	Poly q1(3, 4, -2), q2(0, -4, 10), sum(0, 0, 0);
	sum = q1 + q2;
	cout << q1 << " : q1\n";
	cout << q2 << " : q2\n";
	cout << sum << " : q1 + q2\n";

	return 0;
}
