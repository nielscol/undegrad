// Cole Nielsen 11.13.2014
// CSci 1113 HW 5A
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

double Cylinder::get_height()
{
	return height;
}

double Cylinder::get_radius()
{
	return radius;
}
void Cylinder::get_values(double& h, double& r)
{	
	h = height;
	r = radius;
}

double Cylinder::volume()
{
	return PI * radius * radius * height;
}

void Cylinder::scale(double s)
{
	height *= s;
	radius *= s;
}

void Cylinder::scale(double sh, double sr)
{
	height *= sh;
	radius *= sr;
}

void Cylinder::print(ostream& out)
{
	out.setf(ios::fixed);
	out.setf(ios::showpoint);
	out.precision(2);

	out << "Cylinder height: " << height << "  radius: " << radius << endl;
}
