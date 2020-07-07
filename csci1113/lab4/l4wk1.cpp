#include <iostream>
#include <cmath>
using namespace std;

int GCD(int a, int b)
{
	int r;
	while ((a%b) != 0)
	{
		r = a % b;
		a = b;
		b = r;
	}
	return b;
}

int main()
{
	int a, b;
	char c = 'y';

	while ( c == 'y')
	{
		cout << "Enter A [SPACE] B : ";
		cin >> a >> b;
		a = abs(a);
		b = abs(b);
		cout <<  "GCD: " << GCD(a, b) << endl;
		
		cout << "continue? (y/n): ";
		cin >> c;		
	}
	return 0;
}
