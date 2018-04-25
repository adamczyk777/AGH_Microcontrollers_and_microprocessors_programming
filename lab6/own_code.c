#include <stdio.h>

int sum3c(int a, int b, int c) {
	return a + b + c;
}

int sum3(unsigned int a, unsigned int b, unsigned int c);

void main(void) {
	printf("%d \n",sum3c(1,2,3));
	printf("%d \n",sum3(1,2,3));
}
