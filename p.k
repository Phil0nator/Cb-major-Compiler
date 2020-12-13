//#define __CBLIB_SOURCE
#include "cblib.cb"


void cyclicSwap(int *a, int *b, int *c);
int main() {


    int a, b, c;


    printf("Enter a, b and c respectively: ");
    scanf("%i %i %i", &a, &b, &c);

    printf("Value before swapping:\n");
    printf("a = %i \nb = %i \nc = %i\n", a, b, c);

    cyclicSwap(&a, &b, &c);

    printf("Value after swapping:\n");
    printf("a = %i \nb = %i \nc = %i", a, b, c);

    return 0;
}

void cyclicSwap(int *n1, int *n2, int *n3) {
    int temp;
    // swapping in cyclic order
    temp = @n2;
    @n2 = @n1;
    @n1 = @n3;
    @n3 = temp;
}