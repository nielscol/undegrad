#include <iostream>
#include <cstdlib>
using namespace std;
#define THREE_D 3

double* momentum(double v[], double mass);

double* randVec();

double randMass();

int main()
{
	double mass, seed, x=0, y=0, z=0;
	double* array[1000];
	
	double* p;
	cout << "ENTER A SEED: ";
	cin >> seed;
	srand(seed);
	for(int i=0; i<1000; i++)
	{
		mass = randMass();
		p = randVec();
		array[i] = momentum(p, mass);
	}

	for (int i=0; i<1000; i++)
	{
		double* a;
		a = array[i];
		x += a[0];
		y += a[1];
		z += a[2];
		delete [] a;
	}

	cout << x/1000 << endl << y/1000 << endl << z/1000 << endl;
	return 0;
}

double* momentum(double v[THREE_D], double mass)
{
	for(int i=0; i<THREE_D; i++)
		v[i] *= mass;
	return v;
}

double* randVec()
{
	double* p = NULL;
	p = new double[3];
	for (int i = 0; i < THREE_D; i++)
		p[i] = ((rand()/static_cast<double>(RAND_MAX))*200.0)-100.0; 
	return p;
}

double randMass()
{
	return ((rand()/static_cast<double>(RAND_MAX))*9.0)+1.0;
}
