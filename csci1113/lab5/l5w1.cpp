#include <iostream>
using namespace std;

int main()
{
	int day, month, year;
	char a;
	cout << "Enter a date in mm/dd/yyyy format: ";
	cin >> month >> a  >> day >> a >> year;
	cout << "Year, month, day: ";
	cout << year << "," << month << "," << day << endl;

	return 0;
}
