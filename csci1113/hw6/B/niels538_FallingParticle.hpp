// Cole Nielsen 12.8.2014
// CSci 1113 HW 6B
// niels538@umn.edu
#ifndef NIELS538_FALLINGPARTICLE_HPP
#define NIELS538_FALLINGPARTICLE_HPP
#include "Particle.hpp"

class FallingParticle : public Particle 
{
	public:
		FallingParticle(); 
		FallingParticle(double xInit, double yInit, double vxInit, double vyInit, bool fallInit); 
		void set_isFalling(bool b);
		virtual void update();
	private:
		bool isFalling;
			
};
#endif
