static int factorial(int n); 

static int factorial(int n) {
	if (n >= 1) {
		return n * factorial(n-1);
	}
	return 1;
}

int main() {
	factorial(5);
	return 0;
}