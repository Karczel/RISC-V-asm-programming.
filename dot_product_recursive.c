#include <stdio.h>

int a[5] = {1, 2, 3, 4, 5};
int b[5] = {6, 7, 8, 9, 10};

int dot_product_recursive(int *a, int *b, int size) {
    if (size == 1) return  ;
    return a[0]*b[0] + dot_product_recursive(a+1, b+1, size-1);
}

int main() {
    int result;

    result = dot_product_recursive(a, b, 5);
    printf("The dot product is: %d\n", result);
    return 0;
}
