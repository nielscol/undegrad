#ifndef DECKOFCARDS_H
#define DECKOFCARDS_H
class DeckOfCards
{
	public:
		DeckOfCards();
		int dealCard(int deck[], int& index); 
		void shuffle(int deck[]);
	private:
		int deck[52];
		int index;
}	
#endif
