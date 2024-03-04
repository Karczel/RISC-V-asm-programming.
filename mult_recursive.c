#include <stdio.h>

int mult(int a, int b) {
    if (b == 1) return a;
    return a + mult(a, b-1);
}

int main() {
    int result;

    printf("%d\n", mult(110, 50));
    return 0;
}