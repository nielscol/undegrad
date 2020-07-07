// Cole Nielsen 11.24.2014
// CSci 1113 HW 5B
// niels538@umn.edu
#include <iostream>
#include "niels538_Cylinder.hpp"
using namespace std;

int main()
{
	Cylinder c1, c2(2.234, 5.185), c3(1.0, 10.0), c4;
	double h, r;

	cout << "Output Check c1 : " << c1;
	cout << "Output Check c2, c3 :\n" << "  " << c2 << "  " << c3;
	c4 = c1 + c2;
	cout << "Addition check c4 : " << c4;	
	cout << "Addition check c1 + c3 : " << c1 + c3;
	c4 *= 2.0;
	cout << "Multiplication Check c4 : " << c4;
	c3 *= 4.0;
	c4 *= 3.75;
	cout << "Multiplication Checks c3, c4 :\n" << "  " << c3 << "  " << c4;

	return 0;
}
