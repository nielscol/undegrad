#include <iostream>
#include "niels538_FallingParticle.hpp"

using namespace std;

int main()
{
FallingParticle a, b(1,2,3,1,true);
	
	
	cout << a;
	cout << b;

	a.update();
	b.update();
	
	cout << a;
	cout << b;

	return 0;
}
