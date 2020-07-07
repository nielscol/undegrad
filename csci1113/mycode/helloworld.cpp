#include <iostream> // preprocessor directive, instructs compiler to find file iostream
// or whatever is in the <....> and insert it's contents start at this point

using namespace std; // tells compiler to use standard namespace for the included header files (iostream)

int main() // starting point of program. int decleration means an integer is expected to be returned by main
{
	string username; // declaring the variable username as a string
	cout << "HI! What is your name?\n"; // cout = console output.
	cin >> username; // cin is console input
	cout << "Hello " << username << "!\n";
	return 0; // makes main return the integer 0 as before expected.
}
