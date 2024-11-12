#include <stdio.h>

void buubleSort(int *array, int size) {
  int n = size;
  int *a = array;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (a[j] > a[j + 1]) {
        int temp = a[j];
        a[j] = a[j + 1];
        a[j + 1] = temp;
      }
    }
  }
}

int main() {
  int a[10] = {1, 3, 5, 7, 9, 2, 4, 6, 8, 0};

  printf("Unsorted array : ");

  for (int i = 0; i < 10; i++) {
    printf("%d\t", a[i]);
  }

  buubleSort(a, 10);

  printf("\nSorted array : ");
  for (int i = 0; i < 10; i++) {
    printf("%d\t", a[i]);
  }

  return 0;
}
