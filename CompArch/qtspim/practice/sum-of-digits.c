#include <stdio.h>

int main() {
    int n = 0;
    printf("Enter a number : ");
    scanf("%d", &n);

    int sum = 0;

    while (n > 0) {
        int temp = n % 10;
        sum += temp;
        n /= 10;
    }

    printf("Sum is : %d", sum);

    return 0;
}