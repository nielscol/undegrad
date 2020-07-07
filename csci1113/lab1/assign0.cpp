// Assignment 0
// Cole Nielsen
// 9.9.2014
//
// This program calculates the amount of radioactive
// substance that remains after a specified time interval
#include <iostream>
#include <cmath>
using namespace std;
int main()
{ double init, halflife, time, residual;
// Get values for variables
	cout << "Enter initial amount, half-life, and time" << endl;
	cin >> init >> halflife >> time;
// Compute the residual amount for the given time
	residual = init*pow( 0.5, time/halflife);
// Display residual amount
	cout << "residual amount remaining = " << residual << endl;
	return 0;
}
