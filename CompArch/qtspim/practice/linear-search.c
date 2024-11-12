#include <stdio.h>

int linear_search(int *a, int size, int ele)
{
    size -= 1;

    while (size >= 0)
    {
        if (a[size] == ele)
            return size;
        size -= 1;
    }

    return -1;
}

int main()
{
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
    int search_element = 1;

    int position = linear_search(a, 10, search_element);

    if (position == -1)
        printf("Element not found.");
    else
        printf("Element found at position : %d", position);

    return 0;
}