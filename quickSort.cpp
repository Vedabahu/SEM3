#include <iostream>
#include <vector>

void swap(int *i, int *j)
{
    int temp = *i;
    *i = *j;
    *j = temp;
}

int partition(std::vector<int> a, int low, int high)
{
    int pivot = a[low];
    int i = low, j = high;
    while (i < j)
    {
        do
        {
            i++;
        } while (a[i] <= pivot);
        do
        {
            j--;
        } while (a[j] > pivot);

        if (i < j)
        {
            swap(&(a[i]), &(a[j]));
        }
    }
    swap(&(a[i]), &(a[j]));
    return j;
}

void quicksort(std::vector<int> a, int l, int h)
{
    if (l < h)
    {
        int j = partition(a, l, h);
        quicksort(a, l, j);
        quicksort(a, j + 1, h);
    }
    return;
}

int main()
{
    std::vector<int> a = {3, 0, 9, 1, 2, 8, 6, 7, 5, 4};
    std::cout << "Before : \n";
    for (int x : a)
    {
        std::cout << x << "\t";
    }

    std::cout << "\nAfter : \n";

    quicksort(a, 0, 9);

    for (int x : a)
    {
        std::cout << x << "\t";
    }

    return 0;
}