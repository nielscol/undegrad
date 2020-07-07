#include <iostream>
using namespace std;

bool isLeapYear(int year)
{
	if ((year % 4) ==0)
		{
		if (((year % 100) ==0) && ((year % 400) != 0))
			return 0;
		else 
			return 1;
		}
	else 
		return 0;
}

int main()
{
	int year;
	bool b;
	char a;
	a = 'y';	
	while ( a == 'y')
		{
		cout << "enter a year value: ";
		cin >> year;
		b = isLeapYear(year);
		if (b == 1)
			cout << year << " is a leap year" << endl;
		else
			cout << year << " is not a leap year" << endl;
		
		cout << "continue \"y/n\"? ";
		cin >> a;
		}
	return 0;
}
