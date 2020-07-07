#include <iostream>
#include <fstream>
using namespace std;

int main()
{
	ofstream fout;
	string flight, end = "";
	int h1, m1, h2, m2;
	char a;

	fout.open("flightData.dat");

	while (1)
	{
		cout << "Enter the flight number: ";
		cin >> flight;
		if (flight == "end")
			break;
		cout << "Enter the scheduled/actual arrival times: ";
		cin >> h1 >> a >> m1 >> h2 >> a >> m2;
		
		fout << flight << " " << h1 << ":" << m1 << " " << h2 << ":" << m2 << endl;	
	}
	fout.close();

	return 0;
}
