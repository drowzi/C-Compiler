#include "tests/simple_include.h"
#define my_macro int x = 3;

int main();
int test_if();
int sum(int a, int b);
int product(int a, int b);

int sum(int a, int b) {
	return a + b;
}

int product(int a, int b) {
	return a * b;
}

int test_if() {
	int true, false;
	true = 1;
	false = 0;
	if (true && true) {
		__printident(true);
		return true;
	}
	__printident(false);
	return false;
}

int main() {
	int x, y, z;
	
	// integer literal assignment - expect 3
	x = 3;
	__printident(x);
	
	// simple expression assignment - expect 60
	y = x * 10 * (x - 1); 
	__printident(y); 
	
	// complex expression assignment - expect 1242
	z = x * 5 + (y * 20 + (9 * x));
	__printident(z);
	
	// unary pre dec/inc - expect 4
	++x;
	__printident(x);
	
	// copy assignment - expect 4
	y = x;
	__printident(y);
	
	int true, false;
	true = 1;
	false = 0;
	if (false || false) {
		__printident(true);
	}
	
	//my_macro
	return 0;
}

/* Expectations: 3, 60, 1242, 4, 4 */