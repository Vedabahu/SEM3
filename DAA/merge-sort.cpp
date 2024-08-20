#include <iostream>
#include <vector>

using namespace std;

vector<int> merge(vector<int> left, vector<int> right)
{
    vector<int> merged;
    while (!left.empty() && !right.empty())
    {
        if (left[0] <= right[0])
        {
            merged.push_back(left[0]);
            left.erase(left.begin());
        }
        else
        {
            merged.push_back(right[0]);
            right.erase(right.begin());
        }
    }
    if (!left.empty())
    {
        merged.insert(merged.end(), left.begin(), left.end());
    }
    if (!right.empty())
    {
        merged.insert(merged.end(), right.begin(), right.end());
    }
    return merged;
}

// Create a merge sort algorithm using a vector
vector<int> mergeSort(vector<int> arr)
{
    if (arr.size() <= 1)
    {
        return arr;
    }
    int mid = arr.size() / 2;
    vector<int> leftHalf(arr.begin(), arr.begin() + mid);
    vector<int> rightHalf(arr.begin() + mid, arr.end());
    leftHalf = mergeSort(leftHalf);
    rightHalf = mergeSort(rightHalf);
    return merge(leftHalf, rightHalf);
}

int main()
{
    vector<int> arr = {1, 2, 3, 4, 5};
}