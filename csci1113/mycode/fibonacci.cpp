#include <iostream>

using namespace std;

int main()
{
	double a, b, c, n;
	a = 1;
	b = 0;
	cout << "Enter number of terms:\n";
	cin >> n;
	
	for (n; n>0; n--)  
		{
		c = a + b;
		a = b;
		c = a;
		}
	cout << "Phi approximately equals " << a / b << endl;
	return 0;
}	
