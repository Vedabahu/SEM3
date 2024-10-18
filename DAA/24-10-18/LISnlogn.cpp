#include<stdio.h>
#include<stdlib.h>
#define MAX 100

void enterVals(int arr[], int n);
int binarySearch(int arr[], int l, int r, int m);
int longestIncreasingSubsequence(int arr[], int n);

int main(){
    int n;
    int arr[MAX];
    printf("Enter no. of elements: ");
    scanf("%d",&n);
    
    enterVals(arr,n);
    // printf("Enter elements: \n");
    // for(int i=0; i<n; i++)
    //     scanf("%d",&arr[i]);

    printf("Your Array: \n");
        for(int i=0; i<n; i++)
            printf("%d ", arr[i]);

    int res = longestIncreasingSubsequence(arr, n);
    printf("\n\nThe Longest Increasing Subsequence is of length: %d\n", res);
    return 0;
}

void enterVals(int arr[], int n){
    for(int i=0; i<n; i++){
        int value = rand() % 100;
        arr[i] = value;
    }
}

int binarySearch(int arr[], int l, int r, int key){
    while(r - l > 1){
        int mid = l + (r-l) / 2;
        if(arr[mid] >= key)
            r = mid;
        else
            l = mid;    
    }
    return r;
}

int longestIncreasingSubsequence(int arr[], int n){
    if(n == 0)
        return 0;

    int LIS[n];
    LIS[0] = arr[0];
    int length = 1;

    for(int i=1; i<n; i++) {
        if(arr[i] < LIS[0])
            LIS[0] = arr[i];
        else if(arr[i] > LIS[length-1])
            LIS[length++] = arr[i];
        else{
            int index = binarySearch(LIS,0,length-1,arr[i]);
            LIS[index] = arr[i]; 
        }
    }
    return length;   
}