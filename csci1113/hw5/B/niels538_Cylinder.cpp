// Cole Nielsen 11.24.2014
// CSci 1113 HW 5B
// niels538@umn.edu
#include <iostream>
#include "niels538_Cylinder.hpp"
#define PI 3.14159265358979
using namespace std;

Cylinder::Cylinder()
{
	height = 1.0;
	radius = 1.0;
}

Cylinder::Cylinder(double h, double r)
{
	height = h;
	radius = r;
}

ostream& operator<<(ostream& out, Cylinder c)
{
	out.setf(ios::fixed);
	out.setf(ios::showpoint);
	out.precision(2);
	
	out << "Cylinder height: " << c.height << "  radius: " << c.radius << endl;
}

Cylinder operator + (const Cylinder& a, const Cylinder& b)
{
	Cylinder temp;
	temp.height = a.height + b.height;
	temp.radius = (a.radius + b.radius)/2.0;
	return temp;
}

void Cylinder::operator*=(double s)
{
	height *= s;
	radius *= s;
}
