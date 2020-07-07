#include <iostream>
#include "Complex.h"

using namespace std;

int main()
{
	Complex c1, c2;

	cout<< "Input complex number one : ";
	c1.input(cin);
	cout << "Input complex number two : ";
	c2.input(cin);
	
	c1.output(cout);
	c2.output(cout);
	
	c2.setReal(22.2);
	int a;
	cout << c2.getReal();
	
	c2.output(cout);

	return 0;
}	

