#include <stdio.h>

int max_ind(int a, int b, int c, int d);

void main() {
    printf("\n %d \n", max_ind(1, 2, 3, 4));
    printf("\n %d \n", max_ind(8, 15, 16, 23));
    printf("\n %d \n", max_ind(4, 2, 3, 1));
    printf("\n %d \n", max_ind(1, 2, 4, 4));
    printf("\n %d \n", max_ind(42, 23, 16, 15));
    printf("\n %d \n", max_ind(4, 8, 16, 15));
    printf("\n %d \n", max_ind(42, 23, 42, 15));
    printf("\n %d \n", max_ind(6, 6, 6, 7));
    printf("\n %d \n", max_ind(7, 7, 7, 6));
    
}