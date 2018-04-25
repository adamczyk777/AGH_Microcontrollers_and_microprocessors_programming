//---------------------------------------------------------------
// Program lab_6a - Asemblery Laboratorium IS II rok
//
// To compile&link: gcc -o lab_6a lab_6a.c lab_6a_asm.s
// To run:          ./lab_6a
//
//---------------------------------------------------------------

#include <stdio.h>
#include <time.h>

long long factc( unsigned int k ) {
	if( k <= 1 )
		return 1;
	else
		return k * factc( k - 1 );
}

long long facta(unsigned int k);

void main(void) {
	int i;
	long long res_c, res_a;

	for(i = 1; i <= 50; i++) {
		res_c = factc(i);
		res_a = facta(i);

		printf("FactC(%d) = %ld FactA = %ld,", i, res_c, res_a);
		printf("same? = %s\n", res_c == res_a ? "true" : "false");
	}
}
