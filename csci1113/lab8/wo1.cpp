#include <iostream>
using namespace std;

int choose (int n, int k);

int main()
{
	int n, k;
	
	cout << "Enter n and k: ";
	cin >> n >> k;
	
	cout << choose(n, k) << endl;

	return 0;	

}

int choose (int n, int k)
{
	if (k == 0)
		return 1;
	else if (k == n)
		return 1;
	else 
		return	choose(n-1, k-1) + choose (n-1, k);

}


