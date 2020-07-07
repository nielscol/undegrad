#include "Tree.hpp"

Tree::Tree()
{
	type = "not_a_tree";
	probCatch = 1.0;
	status = 0;
	wetness = 1.0;
	burnTime = 1;
	xpos = 0;
	ypos = 0;
	symbol = "solidtriangle";

}

Tree::Tree(string a, double b, int c, double d, int e, int f, int g, string h)
{
	type = a;
	probCatch = b;
	status = c;
	wetness = d;
	burnTime = e;
	xpos = f;
	ypos = g;
	symbol = h;
}

double Tree::getProbCatch()
{
	return probCatch;
}

void Tree::setProbCatch(double a)
{
	probCatch = a;
}

int Tree::getStatus()
{
	return status;
}

void Tree::setStatus(int a)
{
	status = a;
}

double Tree::getWetness()
{
	return wetness;
}

void Tree::setWetness(double a)
{
	wetness = a;
}

int Tree::getBurnTime()
{
	return burnTime;
}

void Tree::setBurnTime(int a);
{
	burnTime = a;
}
