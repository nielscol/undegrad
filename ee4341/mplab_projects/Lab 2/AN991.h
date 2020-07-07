/////////////////////////////////////////////////////////////////////////////////////////////
// an991.h
// From an application note by Microchip
//
//
// I2C routines for 18F87J50 (and similar PIC18xx with 2 SSP modules)
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
#define PageSize 64

unsigned char putstringI2C( unsigned char *);
unsigned char LDByteWriteI2C( unsigned char, unsigned char, unsigned char );
unsigned char LDByteReadI2C(unsigned char, unsigned char, unsigned char*, unsigned char);
unsigned char LDPageWriteI2C(unsigned char, unsigned char, unsigned char *);
unsigned char LDSequentialReadI2C(unsigned char, unsigned char, unsigned char *, unsigned
char);
unsigned char HDByteWriteI2C(unsigned char, unsigned char, unsigned char, unsigned char);
unsigned char HDByteReadI2C(unsigned char, unsigned char, unsigned char, unsigned char*,
unsigned char);
unsigned char HDPageWriteI2C( unsigned char, unsigned char, unsigned char, unsigned char *);
unsigned char HDSequentialReadI2C(unsigned char, unsigned char, unsigned char, unsigned char
*, unsigned char );
