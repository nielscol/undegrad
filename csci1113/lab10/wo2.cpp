#include <iostream>
#include "poly.h"
#include "complex.h"
using namespace std;

int main()
{
	Poly inpoly;
	cout << "Input a polynomial: ";
	cin >> inpoly;
	for( int i=0; i<= 10; i++)
	{
		cout <<"f("<<i<<") is: "<<inpoly.eval(i) << endl;
	}
	Complex c1, c2;
	inpoly.roots(c1,c2);
	cout << "The roots of f(x) are " << c1 << "\t" << c2 << endl;	

	return 0;
}
