#include <iostream>
#include <string>
#include <cctype>
using namespace std;

int main()
{
	string input;
	int length, c;
	char l;
	int*  letters= new int[26];

	cout << "ENTER A STRING HUMAN: ";
	getline(cin, input);
	length = input.length();
	
	for (int i = 0; i < length; i++)
	{
		l = tolower(input[i]);
		c = static_cast<int>(l);
		if((c>=97) && (c<=122))
		{	
			c-=97;
			letters[c] += 1;
		}
	}	
	for (int i = 0; i <26; i++)
	{
		if (letters[i] > 0)
		{
			l = static_cast<char>(97+i);
			cout << l << "  " << letters[i] << endl;
		}
	}
	return 0;
	delete [] letters;
}
