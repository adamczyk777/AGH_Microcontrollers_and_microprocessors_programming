#include <stdio.h>

unsigned long check_div(long a, long b,long c);

void main() {
    printf("%ld \n", check_div(24, 12, 0));
    printf("%ld \n", check_div(8, 12, 1));
}