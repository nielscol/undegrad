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

int last_day(int year, int month)
{
	switch (month) 
	{
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
		{
			return 31;
			break;
		}
		case 4:
		case 6:
		case 9:
		case 11:
		{
			return 30;
			break;
		}
		case 2:
		{
			bool b;
			b = isLeapYear(year);
			if (b == 1)
				return 29;
			else
				return 28;
		}
	}
}

int main()
{
	int year, month, day, z;
	char a = 'y';

	while ( a == 'y')
		{
		cout << "enter day, month and year: ";
		cin >> day >> month >> year;
		
		z = last_day(year, month);
		if (day == z)
		{	
			day = 1;
			if (month ==12)
			{
				month = 1;
				year++;
			}
			else
				month++;
		}
		else
			day++;
		
		cout << "next day= " << day << " " << month << " " << year << endl;

		cout << "continue \"y/n\"? ";
		cin >> a;
		}
	return 0;
}
