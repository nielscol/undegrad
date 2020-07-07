#include <iostream>
#include <cmath>
#include <fstream>
using namespace std;

const int NROWS = 20;
const int NCOLS = 20;

int main()
{
	ofstream of;
	of.open(temp.dat);
	double temp[20][20], old[20][20];
	double top, bottom, left, right, interior;
	cout << "Enter temperature values for top, bottom, left and right sides: ";
	cin >> top >> bottom >> left >> right;
	cout << "Enter a temperature value for the interior cells: ";
	cin >> interior;
	
	for (int i = 0; i < NCOLS; i++)
	{
		old [0][i] = top;
		old [19][i] = bottom;
	}

	for (int j = 1; j < NROWS-1; j++)
		{
			old [j][0] = left;
			old [j][19] = right;
			for (int k=1; k<NCOLS-1; k++)
			{
				temp[j][k] = interior;	

			}
		}
	
	double conv;
	cout << "Enter convergence criterion: ";
	cin >> conv;
	bool steady = false;

	while (steady == false)
	{
		double r;
		steady = true;
		for (int i = 1; i < NROWS-1; i++)
			{
				for (int j = 1; j < NCOLS-1; j++)
					{
						temp[i][j]= 0.25*( old[i-1][j] + old[i+1][j] + old[i][j-1] + old[i][j+1] );
						r= abs(old[i][j] - temp[i][j]);
						if (r > conv)
							steady = false;
					}
			}
		if (steady == false)
		{
			for (int i =0; i< NROWS; i++)
				for (int j = 0; j < NCOLS; j++)
					old[i][j] = temp[i][j];
		}
	}	
		
	for (

	return 0;
}
