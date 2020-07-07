#include <iostream>

using namespace std;

#define wage 16.78
#define ss 0.06
#define fed 0.14
#define state .05
#define u_dues 10

int main()
{
	double hours, ot, gross;;
	int dependents;
	cout << "Enter number of hours worked per week: ";
	cin >> hours;
	if (hours >40){
		ot = hours-40;
		hours =40;
	}
	gross = wage * hours + (ot * 1.5 * wage);
	cout << endl << "Enter number of dependents: ";
	cin >> dependents;
        cout << endl << "Total pay = " << gross << endl;
        cout << endl << "Social Security tax witholdings = " << ss * gross;
        cout << endl <<"Federal tax witholdings = " << fed * gross;
	cout << endl << "State tax witholdings = " << state * gross;
	cout << endl << "Union Dues = " << u_dues;

	if (dependents >= 3){
		cout << "Helathcare witholdings = 35.00\n";
		cout << "Net pay = " << ((wage * hours + (ot * 1.5 * wage)) * (1-(ss + fed + state)))-u_dues-35 << endl;
	}
	else {
		cout << endl << "Healthcare witholdings = 0.00\n";
		cout << endl << "Net pay = " << ((wage * hours + (ot * 1.5 * wage)) * (1-(ss + fed + state)))-u_dues << endl;
	}
	return 0;
}
