#include <msp430.h> 

// Forward Declaration
int sum(int a, int b);

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	// Declarations
	signed int x = 32767;
	signed int y = 3;

	// Calc sum
	signed int res = sum(x,y);

	while(1);
	return 0;
}

// Sum two int numbers together
signed int sum(signed int a, signed int b) {
    return a + b;
}
