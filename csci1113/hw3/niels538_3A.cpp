//Cole Nielsen 10.22.14
//CSci 1113 HW 3A
//niels538@umn.edu
#include <iostream>
#include <cstdlib>
#include <fstream>
using namespace std;

string suit(int input);
	//Precondition: input is given and it is an integer in the range [1,52]
	//Postcondition: a string containing the suit of the input value is returned

string value(int input);
	//Precondtition: input is given and it is an integer in the range [1,52]
	//Postcondition: a string containing the face value of the input is returned

int main()
{
	ifstream fin;		
	string filename;
	int players, input;
	const int HAND = 5;	

	cout << "Enter the input file name: "; //prompts user to enter filename
	cin >> filename; 		       //file name is stored in the string filename      
	
	fin.open(filename.c_str());	//opens the filename contained in the string filename that the user was promper to enter
	if(fin.fail())			//outputs an error message and exits the program if the specified file fails to open
	{
		cout << "Error: Failure opening input file" << endl;
		exit(1);
	}
	
	cout << "Enter the number of players: ";	//prompts user to enter number of players
	cin >> players;					//stores # of players to int "players"
	
	if ( (players > 10) || (players < 1))		//if the # of players is <1 or >10, an error message is outputted and the program ends.
	{
		cout << "Error: Invalid number of players" << endl;
		exit(1);
	}

	for (int i = 1; i <= HAND; i++)		//this loop and its nested loop output the card value and suite for every card of each player
	{
		for (int j = 1; j <= players; j++)
		{
			fin >> input;
			
			cout << "Player " << j << " , card " << i << ": ";
			cout << value(input) << " of " << suit(input) << endl; //card value and suit are determined by calling the functions suit and value
		}

		cout << endl;
	}

	fin.close();
	
	return 0;
}

string suit(int input)
{
	if ((input >= 1) && (input <= 13))		//figures out suit of card by determining what range the card fits into
		return "clubs";
	else if ((input >= 14) && (input <= 26))
		return "diamonds";
	else if ((input >= 27) && (input <= 39))
		return "hearts";
	else
		return "spades";
}

string value(int input)
{
	if (input > 13)					//if the card is greater than 13, it decrements the value by 13 until it is 13 or less.
		while( input > 13)
			input -= 13;

	switch(input)					//determines the face value by using a switch. The face value is returned as a string
	{
		case 1:
			return "ace";
			break;
		case 2:
			return "2";
			break;
		case 3:
			return "3";
			break;
		case 4:
			return "4";
			break;
		case 5:
			return "5";
			break;
		case 6: 
			return "6";
			break;
		case 7:
			return "7";
			break;
		case 8:
			return "8";
			break;
		case 9:
			return "9";
			break;
		case 10:
			return "10";
			break;
		case 11:
			return "jack";
			break;
		case 12:
			return "queen";
			break;
		case 13:
			return "king";
			break;
	}
}

