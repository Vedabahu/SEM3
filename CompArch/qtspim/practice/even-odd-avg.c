#include <stdio.h>

int a[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

void even_odd_avg()
{
    int i = 0;
    double sum = 0;

    while (i < 9)
    {
        if (a[i] % 2 == 0)
            printf("%d is even.\n", a[i]);
        else
            printf("%d is odd.\n", a[i]);

        sum += a[i];
        i++;
    }

    double average_num = sum / 9;
    printf("Average is %lf", average_num);
}

int main()
{
    even_odd_avg();
}