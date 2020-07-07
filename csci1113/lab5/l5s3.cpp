#include <iostream>
#include <cmath>
using namespace std;

int timeToMinutes (int hours, int mins);
void minutesToTime (int minute_value, int& hours, int& mins);
void elapsedTime (int h1, int m1, int h2, int m2, int& h, int& m);

int main()
{
	int h1, h2, m1, m2, h, m;
	char a = 'y', c;
	
	while (a == 'y')
	{
		cout << "Enter first time (hours:minutes): ";
		cin >> h1 >> c >> m1;
		cout << "Enter second time (hours:minutes): ";
		cin >> h2 >> c >> m2;

		elapsedTime(h1, m1, h2, m2, h, m);
		
		cout.width(2);
		cout.fill('0');		
		cout << "Elapsed time is: " << h << ":" << m << endl;
		
		cout << "Continue? (y/n): ";
		cin >> a;
	}	

	return 0;
}

void minutesToTime(int minute_value, int& hours, int& mins)
{
	hours = (minute_value) / 60;
	mins =  minute_value - (hours * 60);
}

int timeToMinutes (int hours, int mins)
{
	return (hours*60) + mins;
}

void elapsedTime (int h1, int m1, int h2, int m2, int& h, int& m)
{
	int diff;
	diff = abs(timeToMinutes(h1, m1) - timeToMinutes(h2,m2));
	
	minutesToTime(diff, h, m);
}
