// 9.13.14 Cole Nielsen
// CSci 1113 HW 1B
// niels538
#include <iostream>
using namespace std;

#define price_croissant 1.98  // macros to make code more readable
#define price_donut_hole 0.22

int main()
{
	int croissants, donut_holes, cents; //decleration of variables
	double money;

	cout << "Enter the amount of money: ";  // promts user for amount of money
	cin >> money;                           // assigns value to variable money

	croissants = (money/price_croissant);                   // calculates max number of croissants, prints 
	money = money - (croissants * price_croissant);         // value and find remaining money amount
	cout << "Number of croissants: " << croissants << endl;

	donut_holes = (money/price_donut_hole);                 //finds and prints number of donut holes that can
	money = money - (donut_holes * price_donut_hole);       // be bought with remaining money and then
	cents = 100 * money;                                    // finds and shows change left over
	cout << "Number of donut holes: " << donut_holes << endl;
	cout << "Amount of change left: " << cents << " cents"  << endl;

	return 0;
}

