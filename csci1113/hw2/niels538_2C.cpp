// Cole Nielsen 10.2.2014
// CSci 1113 HW 2C "Another Type of Series"
// niels538@umn.edu
#include <iostream>
#include <cstdlib>
using namespace std;

int main ()
{
	int seed, series, r;	//initializes all the variables used
	double p, chance, n=0;
	
	cout << "Input the chance Team A wins: "; //has the user input all the needed values
	cin >> chance;
	if ( (chance < 0.0) || (chance > 1.0))
	{
		cout << "Error. Value must be between 0.0 and 1.0" << endl;
		return 0;
	}
	cout << "Enter an integer seed: ";
	cin >> seed;
	cout << "Enter the number of series: ";
	cin >> series;
	
	srand(seed); // sets the seed for rand
	
	for (int i = 0; i < series ; i++) //loop that runs how many series that user wants
	{
		r = rand();
		p = (static_cast<double>(r))/(static_cast<double>(RAND_MAX)); // generates pseudorandom number from 0 to 1
		if (p <= chance) //if the pseudo random number is lower than or equal to the probability, then the team
			n++;     //wins and the win amount is itterated up.
	}

	cout << "Team A won " << n << " of " << series << " three-game series."<< endl; //displays the number of wins out of played games.
	
	return 0;
}
