#ifndef COMPLEX_H
#define COMPLEX_H
#include <iostream>
using namespace std;

class Complex
{
	public:
		Complex();
		void input(istream& i);
		void output(ostream& o);
		double getReal();
		double getImag();
		void setReal(double);
		void setImag(double);

	private:
		double real;
		double imag;
};
#endif
