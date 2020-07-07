#ifndef TREE_HPP
#define TREE_HPP

class Tree 
{
	public:
		tree();
		tree(string,double,int,double,int,int,int,string);
		double getProbCatch();
		void setProbCatch(double);	
		int getStatus();
		void setStatus(int);
		double getWetness();
		void setWetness(double);
		int getBurnTime();
		void setBurnTime();
	private:
		string type;
		double probCatch;
		int status;
		double wetness;
		double burnTime;
		int xpos;
		int ypos;
		string symbol ;

}

#endif
