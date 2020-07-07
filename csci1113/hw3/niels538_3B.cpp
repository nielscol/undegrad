//Cole Nielsen 10.22.14
//CSci 1113 HW 3B
//niels538@umn.edu
#include <iostream>
#include <cmath>
using namespace std;

double mag(double x, double y, double z);
	//Precondition: must be given x, y and z values of double type
	//Postcondition: will return the magnitude of the vector represented
	//by x, y and z as a value of double type

void normalize(double& x, double& y, double& z);
	//Predcondition: values of type double must be given for x, y and z
	//Postcondition: values of type double will be passed by reference
	//such that they are they are the normed components of the original
	//inputed values representing some vector

void v_interp(double vx, double vy, double vz, double wx, double wy, double xz, double alpha, double& ux, double& uy, double& uz);
	//Precondition: the values for vx, vy, vz, wx, wy and wz must be given and of type double
	//alpha must be given of type double in the range [0.0, 1.0]
	//ux, uy and uz must be declared in the scope of the function/block calling it this function
	//Postcondition: will pass by reference the components of vector u (ux, uy, uz)

int main()
{
	double vx, vy, vz, wx, wy, wz, ux, uy, uz, alpha;
	char a = 'y';

	while ( a == 'y')	//keeps looping if user keeps saying yes ('y') to if they want to find another interpolation
	{
		cout << "Input the first vector: ";	//user is prompted to input the needed values, they are stored to the appropriate variables.
		cin >> vx >> vy >> vz;
		cout << "Input the second vector: ";
		cin >> wx >> wy >> wz;
		cout << "Input the alpha value: ";
		cin >> alpha;
		v_interp(vx, vy, vz, wx, wy, wz, alpha, ux, uy, uz);	//uses the v_interp function to find the interpolated vector
		cout << "Interpolated normal: (" << ux << ", " << uy << ", " << uz << ")" << endl;	//prints out the interpolated vector
		cout << "Find another (y/n)? "; 
		cin >> a;
	}

	return 0;
}

double mag(double x, double y, double z)
{
	return sqrt(x*x + y*y + z*z);	//calculates and returns the square root 
}					//of the sum of all the values squared

void normalize(double& x, double& y, double& z)
{
	double l = mag(x, y, z);	//finds magnitude of vector using mag function
	x = x / l;		//divides each component of the vector by the magnitude to find the normed components
	y = y / l;
	z = z / l;
}

void v_interp(double vx, double vy, double vz, double wx, double wy, double wz, double alpha, double& ux, double& uy, double& uz)
{
	normalize(vx, vy, vz);	//normalizes the inputed vectors
	normalize(wx, wy, wz);
	
	ux = (1 - alpha)*vx + alpha * wx;	//calculates the interpolated components
	uy = (1 - alpha)*vy + alpha * wy;
	uz = (1 - alpha)*vz + alpha * wz;

	normalize(ux, uy, uz);		//norms the interpolated vector
}
