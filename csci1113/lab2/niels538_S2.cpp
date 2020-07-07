#include <iostream> 

using namespace std;

int main()
{
	double temperature;
	string unit;
		
	cout << "Enter the temperature:  ";
	cin >> temperature;
	cout << "Enter Celsius (c) or Fahrenheit (f):  ";
	cin >> unit;

	if (unit == "c")
	cout << "The temperature in Fahrenheit is " << (temperature * 1.8) + 32 << endl;
	else
	cout << "The temperature in Celsius is " << (temperature - 32) / 1.8 << endl;
	return 0;
}
