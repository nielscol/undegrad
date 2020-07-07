// Particle class implementation
#include "Particle.hpp"

// Constructors
Particle::Particle(): x(0.0), y(0.0), vx(0.0), vy(0.0)
{}

Particle::Particle(double x_init, double y_init, double vx_init, 
		   double vy_init): x(x_init), y(y_init), vx(vx_init), vy(vy_init)
{}

// Accessor functions
double Particle::get_x() const
{
  return x;
}

double Particle::get_y() const
{
  return y;
}

double Particle::get_vx() const
{
  return vx;
}

double Particle::get_vy() const
{
  return vy;
}

// Update 
void Particle::update()
{
  x += vx;
  y += vy;
}

// Modify velocity
void Particle::add_to_vel(double dx, double dy)
{
  vx += dx;
  vy += dy;
}

// Friend functions: overloaded input and output
istream& operator>>(istream&  in, Particle& p)
{
  in >> p.x >> p.y >> p.vx >> p.vy;
  return in;
}

ostream& operator<<(ostream& out, const Particle& p)
{
  out.setf(ios::fixed);
  out.setf(ios::showpoint);
  out.precision(2);
  out << p.x << " " << p.y << " " << p.vx << " " << p.vy << endl;
  return out;
}
