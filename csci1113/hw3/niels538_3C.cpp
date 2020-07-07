// Cole Nielsen 10.22.14
// CSci 1113 hw 3C
// niels538@umn.edu
#include <iostream>
#include <cstdlib>
#include <fstream>
#include <cmath>
using namespace std;

void normalize(double v[], int n);
	//Precondition: the array v and int n are given
	//Postcondition: the normed components of the vector will be passed by reference

int main()
{
	ifstream fin;
	ofstream fout;
	
	double v[10];
	int n;
	string i_filename, o_filename;
	
	cout << "Enter the filename of the input file: "; //prompts user for input file name
	cin >> i_filename;				  //stores filename to string
	
	fin.open(i_filename.c_str());			  //opens file using the name stores in string
	
	if (fin.fail()) 				  //checks if file failed to open
	{
		cout << "Error opening the input file";  //if so, outputs error message and exits program
		exit(1);
	}
	
	cout << "Enter the filename of the output file: "; //prompts for output filename
	cin >> o_filename;				   //store output filename to string
	
	fout.open(o_filename.c_str());			   //opens the file 
	
	if (fout.fail())				   //checks if file failed to open
	{
		cout << "Error opening the output file";   //if so outputs error message and exits program
		exit(1);
	}

	fout.setf(ios::fixed);				   //sets fout to floating point
	fout.setf(ios::showpoint);			   //sets fout to show decimal and trailing zeros
	fout.precision(4);				   //sets fout to output to 4 floating points
	
	while(! fin.eof()) 		//this loop keeps executing the statements within it until the eof is reached
	{
		fin >> n;		//takes in the first value per line of the file (the number of elements in the vector)
		
		fout << n << " ";	//outputs the number of elements in the vector in the first postion of each line		

		for (int i = 0; i < n; i++) //stores the vector components to an array
			fin >> v[i];
		
		normalize(v, n);   //norms the vector stored in v 
		
		for (int i = 0; i < n; i ++)  //outputs the values in the array to the output in the same format as the input file
			fout << v[i] << " ";

		fout << endl; //starts a newline after each line/vector has been written

	}	
	
	fin.close();	//closes the files previously opened
	fout.close();

	return 0;
}

void normalize(double v[], int n)
{
	double sum = 0, mag;
	for (int i = 0; i < n; i++)   //finds the sum of the squares of each of all the vector elements
		sum += v[i]*v[i];

	mag = sqrt(sum); 	      //finds the magnitude of the vector by square-rooting the previously found sum

	for (int i = 0; i < n; i++)   //divides each element of the array (vector) by the magnitude to produce the normalized vector
		v[i] = v[i]/mag;
}
