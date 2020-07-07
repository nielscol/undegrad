// Cole Nielsen 12.08.2014
// CSci 1113 HW 6B
// niels538@umn.edu
#include <iostream>
#include <fstream>
#include <cstdlib>
#include "niels538_FallingParticle.hpp"
using namespace std;

int main()
{
	ifstream fin;
	ofstream fout;
	string iFilename, oFilename;
		
	cout << "Enter input file name: ";
	cin >> iFilename;

	fin.open(iFilename.c_str());
	
	if(fin.fail())
	{
		cout << "Error: Failure opening input file.\n";
		exit(1);
	}

	cout << "Enter output file name: ";
	cin >> oFilename;

	fout.open(oFilename.c_str());

	if(fout.fail())
	{
		cout << "Error: Failuring opening output file.\n";
		exit(1);
	}
	
	FallingParticle* array = NULL;
	int size;
	fin >> size;
	array = new FallingParticle[size];

	for(int i = 0; i < size; i++)
	{
		fin >> array[i];
	}

	fin.close();

	bool allYZero = false;

	int steps = 0;
	
	while(allYZero == false)
	{
		allYZero = true;
		for(int i = 0; i < size; i++)
		{
			array[i].update();
			if (array[i].get_y() > 0.0)
				allYZero = false;
		}
		steps++;
	}
	

	fout << "Time steps needed: " << steps << endl;	

	for(int i = 0; i < size; i++)
		fout << array[i];

	delete [] array;
	
	fout.close();

	return 0;

	
}
