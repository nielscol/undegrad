#include "DeckOfCards.h"
#include <cstdlib>
DeckOfCards::DeckOfCards()
{
	for (int i=0; i < 52; i++)
		deck[i] = i;

	shuffle(deck[]);
}

int DeckOfCards::dealCard(int deck[], int& index)
{
	if (index = 52)
	{
		shuffle(deck[]);
		index = 0;
	}
	
	return deck[index];
	index++;	
}

void DeckOfCards::shuffle(int deck[])
{
	for (int i = 0; i < 52; i++)
	{
		int a, b;
		a = rand() % 52;
		b = deck[i];
		deck[i] = deck[a];
		deck[a] = b;
	}
}
