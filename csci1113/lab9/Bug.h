#ifndef BUG_H
#define BUG_H
class Bug
{
 	public:
		Bug (int a);
		Bug ();	
		void move();
		void turn();
		void display();
	private:
		int position;
		int dir;
};


#endif
