// firstccprogram.c

static int myfunc(int x) {
	int g = 3;
	return x * g;
}

int main() {
	int test = 5;
	int copytest = test;
	int x = 3;
	int y = x;
	int z = y;
	test = 3;
	static int testvar = 3 * 5 * 10;
	copytest = myfunc(testvar);
	return 0;
}