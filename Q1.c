#include <msp430.h> 
float y = 1.0;
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	int x = 0;
	x++; // Local variable increment

	y--; // Global variable decrement

	// Hex with logic
	unsigned char z = 0x0a;
	unsigned char w = 0x05;

	unsigned char and_result = z && w;
	unsigned char nor_result = !(z || w);

	return 0;
}
