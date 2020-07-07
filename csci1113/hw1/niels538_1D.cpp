// 9.21.2014 Cole Nielsen
// CSci 1113 HW 1D
// niels538

#include <iostream>
using namespace std;

int main()
{
	int n, t, d; //declares n (number), t (divisor test variable) and d (number of divisors)
	for ( n=2 ; n<=100; n++) //this loop increments the number being tested
	{
		d = 0; //sets number of divisors to zero when testing a new number
		for ( t=1 ; t <= n-1 ; t++)	//divisor test loop
			{
			if (n % t == 0) //if the remainder of the number being tested (n) with test divisor t is zero, 
				d++;    // then t is a real divisor of n and and the number of divisors d is incremented
			} 
			
		cout << n << "\t" << d << endl; //prints out the number that was tested each cycle of the loop and 
	}					//and its number of divisors
	return 0;
}	



