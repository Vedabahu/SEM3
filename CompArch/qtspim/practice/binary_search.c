#include <stdio.h>

int binary_search(int* arr, int size, int ele) {

    int a = 0;
    int b = size - 1;
    int mid = 0;

    while (a < b) {
        mid = (a + b) / 2;
        int temp = arr[mid];
        if (temp == ele)
            return mid;
        else if (ele < temp)
            b = mid - 1;
        else
            a = mid + 1;
    }

    return -1;
}

int main()
{
    int a[11] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int search_elelmet = 7;

    int position = binary_search(a, 11, search_elelmet);

    if (position == -1) 
        printf("Element not found.");
    else
        printf("Element found at position : %d", position);

    return 0;
}