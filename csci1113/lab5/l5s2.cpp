#include <iostream>
using namespace std;

void minutesToTime(int minute_value, int& hours, int& mins);

int main()
{
	int mins, hours, minute_value;
	char a, c= 'y';

	while ( c == 'y')
	{
		cout <<"Enter a number of minutes: ";
		cin >> minute_value;
		
		minutesToTime( minute_value, hours, mins);
		cout << "Hours:minutes is " << hours << ":";
		cout.width(2);
		cout.fill('0');
		cout << mins;
		cout << endl;		
	
		cout << "Continue? (y/n): ";
		cin >> c;
	}

	return 0;
}

void minutesToTime(int minute_value, int& hours, int& mins)
{
	hours = (minute_value) / 60;
	mins =  minute_value - (hours * 60);
}
