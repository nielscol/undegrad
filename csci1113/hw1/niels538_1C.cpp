// 9.21.2014 Cole Nielsen
// CSci 1113 HW 1C
// niels538

#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	int altitude, previous, change = 0; //defines variables for altitude, previous altitude and total change
	cout << "Please enter the original altitude in meters: ";
	cin >> previous; // inputs users altitude value that was previously promted

	while (1)
	{
	cout << "Please enter the next altitude (-1 to end): "; // prompts user from new altitude
	cin >> altitude;
	if (altitude == -1)	//checks if input is -1 and if so breaks the loop and ends
		break;
	change = abs(altitude - previous) + change; // calculates change and adds to previous change
	previous = altitude;
	}
	cout << "Total Altitude Change: " << change << " meters\n"; //outputs total change
	
	return 0;
	}
