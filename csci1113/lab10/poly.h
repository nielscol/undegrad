#ifndef POLY_H
#define POLY_H
#include <iostream>
using namespace std;
class Poly
{
	public: 
		Poly();
		Poly(double, double, double);
		Poly operator +(Poly);
		friend ostream& operator <<(ostream& , Poly);
		friend istream& operator >>(istream& , Poly&);
		double eval(double);
		void roots(Complex&, Complex&);
	private:
		double a;
		double b;
		double c;
};


#endif
