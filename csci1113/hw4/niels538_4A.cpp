// Cole Nielsen 11.03.2014
// CSci 1113 HW 4A
// niels538@umn.edu
#include <iostream>
using namespace std;

int main()
{
	string large, pattern; //large is the string that contain the sequence to be checked, pattern is the pattern checked for
	int llarge, lpattern;  //variable that will be used to store each string's length

	cout << "Enter the larger string : ";
	cin >> large;
	cout << "Enter the search pattern : ";
	cin >> pattern;
	
	llarge = large.length();	//stores the length of the strings to the respective variable 
	lpattern = pattern.length();
	
	for (int i = 0; i <= llarge-lpattern; i++)	//used to iterate up the start index used to check for patterns
	{
		int diff = 0;				//variable that stores number of differences found at each index
		
		for (int j = 0; j < lpattern; j++)	//loop checks for differences in the pattern string and the characters starting at a index i
			if(large[i+j] != pattern[j])    // if there are differences, the variable diff is incremented by 1
				diff++;
		
		cout << "Starting at index " << i << " there are " << diff << " differences." << endl;	// outputs the number of differences.
	} 

	return 0;
}
