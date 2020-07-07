#include <iostream>
using namespace std;

int timeToMinutes (int hours, int mins);

int main()
{
	int hours, mins;
	char a, c= 'y';

	while ( c == 'y')
	{
		cout <<"Enter a time duration (hh:mm) ";
		cin >> hours >> a >> mins;
		cout << "Total minutes: " << timeToMinutes(hours, mins) << endl;		
		cout << "Continue? (y/n): ";
		cin >> c;
	}

	return 0;
}

int timeToMinutes (int hours, int mins)
{
	return (hours*60) + mins;
}
