// Cole Nielsen 11.13.2014
// CSci 1113 HW 5A 
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
		double get_height();
		double get_radius();
		double volume();
		void get_values(double& h, double& r);
		void scale(double s);
		void scale(double sh, double sr);
		void print(ostream& out);
	private:
		double height;
		double radius;
};

#endif
