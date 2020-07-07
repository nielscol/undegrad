#include <iostream>
#include <cmath>
#include "poly.h"
using namespace std;

Poly::Poly()
{
	a = 0.0;
	b = 0.0;
	c = 0.0;
}

Poly::Poly(double x, double y, double z)
{
	a = x;
	b = y;
	c = z;
}

double Poly::eval(double x)
{
	return a*x*x + b*x + c;
}

void Poly::roots(Complex& a, Complex & b)
{
	if ((b*b - 4*a*c) < 0)
	{
		a.real = -b/(2*a);
		b.real = -b/(2*a);
		a.imag = sqrt(abs(b*b - 4*a*c))/(2*a);
		b.imag = -sqrt(abs(b*b - 4*a*c))/(2*a);
	}
	else
	{
		a.real = -b/(2*a) + sqrt(abs(b*b - 4*a*c))/(2*a);
		b.real = -b/(2*a) - sqrt(abs(b*b - 4*a*c))/(2*a);
		a.imag = 0.0;
		b.imag = 0.0;
	}
}

istream& operator >>(istream& in, Poly& i)
{
	in >> i.a >> i.b >> i.b;
}

ostream& operator <<(ostream& out, Poly i)
{
	if ((i.a > 0) || (i.a < 0))
		out << i.a << "x^2 ";
	if (i.b > 0)
		out << "+ " << i.b << "x ";
	else if (i.b < 0)
		out << "- " << -1 * i.b << "x ";
	if (i.c >= 0)
		out << "+ " << i.c;
	else
		out << "- " << -1 *  i.c;
}

Poly Poly::operator +(Poly i)
{
	Poly temp;
	temp.a = a + i.a;
	temp.b = b + i.b;
	temp.c = c + i.c;
	return temp; 
}
