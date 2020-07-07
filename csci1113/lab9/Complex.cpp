#include "Complex.h"
#include <iostream>
using namespace std;

Complex::Complex()
{
	real = 0;
	imag = 0;
}

void Complex::input(istream& i)
{
	i >> real >> imag;
}

void Complex::output(ostream& o)
{
	o << real << " + " << imag << "i" << endl;
}

double Complex::getReal()
{
	return real;
}

double Complex::getImag()
{
	return imag;
}

void Complex::setReal(double a)
{
	real = a;
}

void Complex::setImag(double b)
{
	imag = b;
}
