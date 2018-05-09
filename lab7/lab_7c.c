#include <stdio.h>

long long min_of_three_C(unsigned int a, unsigned int b, unsigned int c)
{
	return a <= b && a <= c ? a : (b <= a && b <= c ? b : c);
}

long long min_of_three_S(unsigned int a, unsigned int b, unsigned int c);

void main(void)
{
	long long a = 11, b = 2, c = 5;
	printf("%d \n", min_of_three_C(a, b, c));
	printf("%d \n", min_of_three_S(a, b, c));
}
