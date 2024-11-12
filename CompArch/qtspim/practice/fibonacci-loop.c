#include <stdio.h>

int fib(int n)
{
    if (n < 2)
    {
        return n;
    }

    int t1 = 0, t2 = 1;
    int next = t1 + t2;

    for (int i = 3; i <= n; i++)
    {
        t1 = t2;
        t2 = next;
        next = t1 + t2;
    }

    return t2;
}

int main()
{
    int n = 0;
    printf("Enter a number : ");
    scanf("%d", &n);

    int x = fib(n);

    printf("Fib is : %d", x);

    return 0;
}