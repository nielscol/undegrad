#include <iostream>
#include <cmath>

using namespace std;

int main()
{
	float weight, height, age, BMR;
	string gender;

	cout << "Enter your weight, height, age and gender (M/F):\n";
	cin >> weight >> height >> age >> gender;
	
	if (gender == "M")
	{
	BMR = 66 + (6.3 * weight) + (12.9 * height) - (6.8 * age);
	cout << "Number of chocolate bars = " << BMR/230 << endl;
	}

	else
	{
	BMR = 655 + (4.3 * weight) + (4.7 * height) - (4.7 * age);
	cout << "Number of chocolate bars = " << BMR/230 << endl; 
	}

	return 0;
}
