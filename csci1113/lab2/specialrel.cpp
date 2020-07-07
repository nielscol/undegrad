#include <iostream>
#include <cmath>

using namespace std;

int main()
{
	double L, v, c = 3E10, LR;
	cout << "Input value for L and V\n";
	cin >> L >> v;
	cout << L * sqrt(1-((v*v)/(c*c))) << endl;
	return 0;
}
