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

		//creates the arrays used for the particles and number of steps
	FallingParticle* array = NULL;
	int size;
	fin >> size;
	array = new FallingParticle[size];
		
	int* sArray = NULL;
	sArray = new int[size];

	for(int i = 0; i < size; i++)
	{
		fin >> array[i];
		array[i].set_isFalling(false);
	}

	for(int i = 0; i < size; i++)
		sArray[i] = 0;

	fin.close();

	bool allYZero = false;

	int steps = 0;
	
		//update loop	
	while(allYZero == false)
	{
		allYZero = true;
		for(int i = 0; i < size; i++)
		{
			if(array[i].get_y() > 0.0)
				array[i].update();
			if(array[i].get_x() > 200.0)
				array[i].set_isFalling(true);
			if (array[i].get_y() > 0.0)
				allYZero = false;
			if((array[i].get_y() < 0.0) && (sArray[i] ==0))
				sArray[i] = steps+1;
		}
		steps++;
	}

	fout << "Time steps needed: " << steps << endl;	
		
		//print out the data for particle positions
	for(int i = 0; i < size; i++)
	{
		fout << array[i];
		fout << sArray[i] << endl;
	}

		//delete the dynamic arrays	
	delete [] array;
	delete [] sArray;

	fout.close();

	return 0;
}
