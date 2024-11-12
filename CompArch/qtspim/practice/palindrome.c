#include <stdio.h>

int palHelper(char str[], int begin, int end)
{
    if (begin == end)
        return 1;
    if (str[begin] != str[end])
        return 0;

    if (begin < end + 1)
    {
        return palHelper(str, begin + 1, end - 1);
    }

    return 1;
}

int isPalindrome(char str[], int size)
{
    if (size == 0)
        return 1;

    return palHelper(str, 0, size - 1);
}

int main()
{

    char str[6] = "madam";
    int size = 5;

    int z = isPalindrome(str, size);

    if (z == 1)
    {
        printf("String is a palindrome.\n");
    }
    else
    {
        printf("String is not a palindrome.\n");
    }

    return 0;
}