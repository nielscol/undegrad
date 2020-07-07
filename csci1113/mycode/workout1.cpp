#include <iostream>

using namespace std;

int main()
{
	float pounds;
	cout << "Enter weight in pounds to convert it kilograms:\n";
	cin >> pounds;
	cout << pounds << " pounds equals " << 0.454 * pounds << " kilograms\n";
	return 0;
}
