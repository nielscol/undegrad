#include <iostream>
#include <string>
using namespace std;

string nextString(string CVS, int& index);

int split(string str, string a[], int max_size);

const int VALUES = 400;

int main()
{
	string CVS, varray[VALUES];
	int index;
	//cout << "Enter CVS string followed by index value: ";
	//cin >> CVS >> index;i
	
	int cnt = split("my,cat,ate,my,homework",varray, VALUES);
	for(int i =0; i <= cnt; i++)
		cout << varray[i] << endl;
	//cout << nextString(CVS, index) << endl;
	return 0;
}

string nextString(string CVS, int& index)
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

int split(string str, string a[], int max_size)
{
	int index = 0, length, ai=0;
	length = str.length();
	string value = "";
	
	while (index < length)
	{
		value += nextString(str, index);
		a[ai] += value + "\n";
		value = "";
	}

	return ai;
}
