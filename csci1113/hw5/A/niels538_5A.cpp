// Cole Nielsen 11.13.2014
// CSci 1113 HW 5A
// niels538@umn.edu
#include <iostream>
#include "niels538_Cylinder.hpp"
using namespace std;

int main()
{
	Cylinder c1, c2(2.0, 4.0), c3(1.0, 8.0);
	double h, r;

	cout << "c1: ";
	c1.print(cout);
	cout << "c2: ";
	c2.print(cout);
	cout << "c3: ";
	c3.print(cout);
	cout << "c1 height an radius: " << c1.get_height() << ", " << c1.get_radius() << endl;
	cout << "c3 volume: " << c3.volume() << endl;
	c2.scale(3.22);
	c3.scale(3.55);
	cout << "Scaled c2 height and radius: " << c2.get_height() << ", " << c2.get_radius() << endl;
	c3.get_values(h, r);
	cout << "Scaled c3 height and radius: " << h << ", " << r << endl;
	c3.scale(2.15, 2.00);
	cout << "Scaled c3 volume: " << c3.volume() << endl;

	return 0;
}
