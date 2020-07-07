#include <iostream>
#include <string>
using namespace std;

string nextString(string CVS, int index);

int main()
{
	string CVS;
	int index;
	cout << "Enter CVS string followed by index value: ";
	cin >> CVS >> index;
	cout << CVS << index << endl;
	cout << nextString(CVS, index) << endl;
	return 0;
}

string nextString(string CVS, int index)
{
	int a=0, length;
	length = CVS.length();
	string ret = "";
	char n; 
	if (CVS[index] == ',')
		index += 1;

	while ((CVS[index] != ',') && (index < length))
	{
		ret += CVS[index];
		index += 1;
		a += 1;
	} 
	return ret;
}

