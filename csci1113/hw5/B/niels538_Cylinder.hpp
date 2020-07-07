// Cole Nielsen 11.24.2014
// CSci 1113 HW 5B 
// niels538@umn.edu
#ifndef CYLINDER_HPP
#define CYLINDER_HPP
#include <iostream>
using namespace std;

class Cylinder
{
	public:
		Cylinder();
		Cylinder(double h, double r);
		friend ostream&  operator <<(ostream& , Cylinder c);
		friend Cylinder operator +(const Cylinder& a, const Cylinder& b);
		void operator *=(double s);
	private:
		double height;
		double radius;
};

#endif
