//---------------------------------------------------------------
// Program lab_6b - Asemblery Laboratorium IS II rok
//
// To compile&link: gcc -o lab_6b lab_6b.c lab_6b_asm.s
// To run:          ./lab_6b
//
//---------------------------------------------------------------

#include <stdio.h>
#include <time.h>

long long fibc( unsigned int k )
{
	if( k == 0 )
		return 0;
	else if( k == 1 )
		return 1;
	else
		return fibc( k - 2 ) + fibc( k - 1 );
}

long long fiba( unsigned int k );

void main( void ) {
	int i;
	clock_t beginC, endC, beginA, endA;
	long timeC, timeA;

	puts("C lang");
	
	beginC = clock();
	for( i = 0; i <= 42; i++ )
		printf( "FibC( %2d ) = %ld\n", i, fibc( i ) );
	endC = clock();
	timeC = endC - beginC;
	printf("C time = %ld \n", timeC);

	puts("assembly");
	beginA = clock();
	for( i = 0; i <= 42; i++ )
		printf( "FibA( %2d ) = %ld\n", i, fibc( i ), fiba( i ) );
	endA = clock();
	timeA = endA - beginA;
	printf("Assembly time = %ld \n", timeA);

	printf("Assembly time: %ld\n", timeA);
	printf("C time: %ld\n", timeC); 
	printf("%s was faster\n", timeC <= timeA ? "C" : "Assembly" );
}
