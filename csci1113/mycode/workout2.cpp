#include <iostream>
#include <cmath>

using namespace std;

int main()
{
	int t, v; // t is temperature in fahrenheit, v is windspeed in mph
	cout << "Enter temperature in Fahrenheit and then wind velocity in mph\n";
	cin >> t >> v; 
	cout << "THe windchill is " << 35.74 + (0.6215 * t) - ( 35.75 * pow(v, 0.16)) + (0.4275 * t * pow(v, 0.16)) << " degrees.\n";
	return 0;
}
