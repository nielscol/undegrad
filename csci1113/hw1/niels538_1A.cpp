// 9.13.2014 Cole Nielsen
// CSci 1113 HW 1A
// niels538
#include <iostream>
using namespace std;

int main()
{

	int red, green, blue;                        // Prompts user for RGB values and assigns
	cout << "Enter the red component: ";         // them to the respective red, green and
	cin >> red;                                  // blue variables
	cout << "Enter the green component: ";
	cin >> green;
	cout << "Enter the blue component: ";
	cin >> blue;
	cout << "In descending order: ";

	
	if ((red > green)&&(red > blue)){               // this conditional statement tests if red is 
		cout << "red ";                        // greatest, and if so prints "red", then 
		if (green > blue)                       // finds the next largest value and prints
			cout << "green blue" << endl;  // the respective values
		else 
			cout << "blue green" << endl;
	}


	else if (green > blue){                         //similar to the last conditional statement
		cout << "green ";                      // but it checks to see if green if largest
		if (red > blue)                         // if red isn't
			cout << "red blue" << endl;
		else
			cout << "blue red" << endl;
	}


	else{                                           //if neither red or green are largest, assumes
		cout << "blue ";                       // blue is largest prints it and then does the
		if (red > green)                        // same as the other two conditional statements
			cout << "red green" << endl;
		else 
			cout << "green red" << endl;
	}
	return 0;
}
