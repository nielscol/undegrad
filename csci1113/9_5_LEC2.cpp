//Example C++ function
//September 5, 2014

#include <iostream>
using namespace std; //use generic namespace

int main() //takes no argument (empty parentheses), returns an integer. returns 1 if all good, 0 if somehting fails
{
	int number;
	cout << "Enter your number\n"; //cout is output stream, less than signs indicate "flow", \n is newline
	cin >> number; //cin is input stream "going to" number, decleration?
	cout << "Two, times ";
	cout << number;
	cout << " is ";
	cout << 2 * number;
	cout << "\n"; //end1 does the same thing as \n
	return 0;
}
