// Cole Nielsen 11.24.2014
// CSci 1113 HW 5C
// niels538@umn.edu
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
using namespace std;

int main()
{
	string filename, search;
	ifstream fin;
	char a = 'y';
	int n;

	cout << "Input file name: ";
	cin >> filename;

	fin.open(filename.c_str());

	if(fin.fail())		
	{
		cout << "Error: Failure opening file." << endl;
		exit(0);
	}

	fin >> n;
	
	string *array = NULL;
	array = new string[n];
	
	for (int i = 0; i < n; i++)
	{	
		fin >> array[i];
	}	

	fin.close();


	while (a == 'y')
	{
		cout << "Search string: ";
		cin >> search;
		
		cout << "'" << search << "' found in strings with the following indices:" << endl;

		int slength = search.length();

		for (int i = 0; i < n; i++)
		{
			string astring = array[i];
			int alength = astring.length();
			for (int j = 0; j <= (alength-slength); j++)
			{
				if (search == astring.substr(j, slength))
				{
					cout << i << " " << astring << endl;
					break;
				}
			
			}
		}

		cout << "Do you wish to do another search (y/n)? ";
		cin >> a;
	}

	delete [] array;	

	return 0;

}
