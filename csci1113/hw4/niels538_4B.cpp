// Cole Nielsen 11.7.14
// CSci 1113 HW 4B
//niels538@umn.edu
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <fstream>
using namespace std;

#define MAX_COLORS 60
#define COMPONENTS 3

struct acolor //structure for input color
{
	int r,g,b;
};

int distance (int r, int g, int b, struct acolor icolor); //function for finding the distance between two colors

int main ()
{
	ifstream fin;

	string filename;
	string name[MAX_COLORS];
	int color[MAX_COLORS][COMPONENTS];
	int index_min;	
	char a = 'y';
	acolor icolor;	      //structure for intput color
	double min = 1000, d; //min stores the minimum distance found. It is inititialized
			      //at 1000 so it is greater than the max possible distance
			      //d is the distance for any given color being tested
	
	cout << "Enter input filename: ";
	cin >> filename;

	fin.open(filename.c_str());

	if(fin.fail())
	{
		cout << "Error: failure opening the input file." << endl;
		exit(0);
	}

	for (int i = 0; i < MAX_COLORS; i++)	//this loop stores the color values to the 2d array color
	{					//and the color name to the string array name
		for (int j = 0; j < COMPONENTS; j++)
			fin >> color[i][j];
		fin >> name[i];
		
	}

	fin.close();	//closes input file as all the needed info has been read

	while (a == 'y') //continuation loop that finds the closest color to the inputted color
	{
		min = 1000;					//sets the minimum difference to a number higher than possible 
		cout << "Enter r,g,b for the search color: ";	//asks user for a color and stores it
		cin >> icolor.r >> icolor.g >> icolor.b;
		
		for (int i = 0; i < MAX_COLORS; i++)  //this loop checks each color in the array against the user supplied one
		{
			d = distance(color[i][0], color[i][1], color[i][2], icolor); //finds distance between the given color and a color in the array
			if (d < min) 		//if the distance of a color in the array is smaller than they previous smaller
			{
				min = d;        //it is then set as the minimum
				index_min = i;  //and the index for that color in the array is stored
			}
		}

		cout << "Closest color: (" << color[index_min][0] << ", " << color[index_min][1] << ", " << color[index_min][2] << ")   " << name[index_min] << endl;
	
		cout << "Do you wish to match another color (y/n)? ";
		cin >> a;
	}

	
	return 0;
}

int distance (int r, int g, int b, struct acolor icolor) 
{
	return sqrt(pow(icolor.r - r, 2) + pow(icolor.g - g, 2) + pow(icolor.b - b, 2));	
}
