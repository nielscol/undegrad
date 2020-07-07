#include <iostream>
using namespace std;

const int ELEMENTS=50;

void bsort(int list[ELEMENTS], int ELEMENTS, bool& change);
void swap(int& a, int& b);

int main()
{
	bool change = true;
	int list[50];

		for (int i = 0, q=100; i<50; i++)
		{
			list[i] = q;
			--q;
		}
	
	while (change == true)
	{
		change = false;
		bsort(list, ELEMENTS, change);
		
	}

	for (int i = 0, l=1; i<50; i++,l++ )
	{
		cout << list[i] << " ";
		if (l == 5)
		{
			cout << endl;
			l = 0;
		}
	
	}
	return 0;
}

void bsort (int list[ELEMENTS], int ELEMENTS, bool& change)
{
	for (int i=0; i<(ELEMENTS-1); i++)
		{
			int a, b;
			a = list[i];
			b = list[i+1];
			if (a>b)
			{
				
				swap(a, b);
				list[i] = a;
				list[i+1] = b;
				change = true;
			}
		}
}

void swap (int& a, int& b)
{
	int c, d;
	c = a;
	d = b;
	a = d;
	b = c;
}
