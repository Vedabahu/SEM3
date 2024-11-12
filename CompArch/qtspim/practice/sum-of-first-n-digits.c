#include <stdio.h>

int n = 55;

int main() {
    
    int sum = 0;
    while (n > 0) {
        sum += n;
        n--;
    }

    printf("Sum is %d", sum);
    
    return 0;
}