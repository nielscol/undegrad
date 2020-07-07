#include <iostream>
#include <fstream>
using namespace std;

int main()
{
	ifstream fin;
	string flight, end = "", file;
	int h1, m1, h2, m2;
	char a;
	cout << "ENTER FILE NAME: ";
	cin >> file;

	fin.open(file.c_str());

	while (fin.eof() == false)
	{
		fin >> flight >> h1 >> a >> m1 >> h2 >> a >> m2;
		cout << flight <<" " << h1 << ":" << m1 << " " << h2 << ":" << m2 << endl;
	
	}
	fin.close();

	return 0;
}
