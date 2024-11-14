# Python program to find lis using Bottom Up
# Tabulation in O(n^2) Time and O(n)

# lis returns length of the longest
# increasing subsequence in arr of size n
def lis(arr):
    n = len(arr)

    # Declare the list (array) for LIS and
    # initialize LIS values for all indexes
    lis = [1] * n

    # Compute optimized LIS values in bottom
    # -up manner
    for i in range(1, n):
        for prev in range(0, i):
            if arr[i] > arr[prev]:
                lis[i] = max(lis[i], lis[prev] + 1)

    # Return the maximum of all LIS values
    return max(lis)

if __name__ == '__main__':
    arr = [10, 22, 9, 33, 21, 50, 41, 60]
    print(lis(arr))
