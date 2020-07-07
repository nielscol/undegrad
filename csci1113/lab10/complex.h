#ifndef COMPLEX_H
#define COMPLEX_H
#include <iostream>
using namespace std;
class Complex
{
	public:
		Complex();
		Complex(double x, double y);
		void input(istream& i);
		void output(ostream& o);
		double getReal();
		double getImag();
		void setReal(double);
		void setImag(double);
		friend ostream& <<(ostream&, Complex);
		friend istream& >>(istream&, Complex&);
		Complex operator+(Complex);
		Complex operator-(Complex);
	private:
		double real;
		double imag;
};
#endif
