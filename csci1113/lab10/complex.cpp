#include <iostream>
#include <fstream>
#include "complex.h"
using namespace std;
Complex::Complex() {
	real = 0.0;
	imag = 0.0;
}
Complex::Comples(double x, double y) 
{
	real = x;
	imag = y;
}

ostream& operator <<(ostream& out, Complex a)
{
	out <<  a.real << " + " << a.imag << "i";
}

Complex Complex::operator +(Complex a);
{
	Complex temp;
	temp.real = real + a.real;
	temp.imag = imag + a.imag;
	return temp;
}

Complex Complex::operator -(Complex a);
{
	Complex temp;
	temp.real *= -1;
	a.imag *= -1;
}

istream& operator >>(istream& in, Complex& a)
{
	in >> a.real >> a.imag;
}
/*void Complex::input(istream& i){
	i>>real>>imag;
}
void Complex::output(ostream& o){
	o<<real<<" + "<<imag<<"i"<<endl;*/
}
double Complex::getReal(){
	return real;
}
double Complex::getImag(){
	return imag;
}
void Complex::setReal(double r){
	real = r;
}
void Complex::setImag(double i){
	imag = i;
	
}
