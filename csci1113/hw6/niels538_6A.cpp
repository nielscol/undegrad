// Cole Nielsen 12.05.2014
// CSci 1113 HW 6A
// niels538@umn.edu
#include <iostream>
#include <fstream>
#include <cstdlib>
#include "Particle.hpp"
using namespace std;

int main()
{
	Particle array[20];
	ifstream fin;
	ofstream fout;
	string iFilename, oFilename;
		
	cout << "Enter input file name: ";
	cin >> iFilename;

	fin.open(iFilename.c_str());
	
	if(fin.fail())
	{
		cout << "Error: Failure opening the specified input file.\n";
		exit(1);
	}

	cout << "Enter output file name: ";
	cin >> oFilename;

	fout.open(oFilename.c_str());

	if(fout.fail())
	{
		cout << "Error: Failuring opening the specified output file.\n";
		exit(1);
	}

	int arraySize = 0;

	for(int i = 0; !fin.eof(); i++)
	{
		fin >> array[i];
		arraySize++;
	}

	fin.close();

	fout << "Original Information\n";	

	for(int i = 0; i < arraySize; i++)
		fout << array[i];

	for(int i = 1; i<=100; i++)
	{
		for(int j = 0; j < arraySize; j++)
			array[j].update();

		if((i % 10) == 0)
		{
			fout << "Time step " << i << endl;

			for(int j = 0; j < arraySize; j++)
				fout << array[j];
		}	
	}

	fout.close();

	return 0;

	
}
