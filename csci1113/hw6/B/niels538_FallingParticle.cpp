// Cole Nielsen 12.8.14
// CSci 1113 HW 6B
// niels538@umn.edu
#include "niels538_FallingParticle.hpp"
#include "Particle.hpp"

FallingParticle::FallingParticle() : Particle(), isFalling(true)
{
}

FallingParticle::FallingParticle(double xInit, double yInit, double vxInit, double vyInit, bool fallInit) : Particle(xInit, yInit, vxInit, vyInit), isFalling(fallInit)
{
}

void FallingParticle::set_isFalling(bool b)
{
	isFalling = b;
}

void FallingParticle::update()
{
	if(isFalling == true)
	{
	 	add_to_vel(0, -9.81);
	}
	Particle::update();
}
