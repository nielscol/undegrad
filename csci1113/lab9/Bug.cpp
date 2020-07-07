#include "Bug.h"
#include <iostream>
using namespace std;
Bug::Bug()
{
	position = 0;
	dir = 1;
}

Bug::Bug(int a)
{
	position = a;
	dir = 1;
}

void Bug::move() 
{
	position += dir;
}

void Bug::turn ()
{
	dir *= -1;
}

void Bug::display ()
{
	cout << "Position : " << position << " Direction : " << dir << endl;
}
