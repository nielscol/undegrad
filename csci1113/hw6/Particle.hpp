#ifndef PARTICLE_HPP
#define PARTICLE_HPP
// Particle Class Interface
#include <iostream>
using namespace std;

// This class is for a 2D particle with location x,y, and velocity vx,vy.
class Particle
{
 public:
  // Friend functions: 
  //    Overloaded input operator reads values for x,y,vx,vy from in.
  //    Overloaded output operator writes values for x,y,vx,vy to out,
  //       with each value written with two digits to the right of
  //       the decimal point, all values separated by a single space,
  //       and an endl at the end of the line.
  friend istream& operator>>(istream&  in, Particle& p); 
  friend ostream& operator<<(ostream& out, const Particle& p); 

  // Constructors
  Particle();
  Particle(double x_init, double y_init, double vx_init, double vy_init);

  // Other member functions
  double get_x() const;
  double get_y() const;
  double get_vx() const;
  double get_vy() const;
  // update adds vx to x, and vy to y
  void update();
  // add_to_vel adds dx to vx, and dy to vy
  void add_to_vel(double dx, double dy);   

 private:
  double x, y;    // location
  double vx, vy;  // velocity
};
#endif
