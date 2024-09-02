/*
Name : Rutwik S
Roll Number: 23BCS112
Descreption: Implement the 1-bit ALU capable of performing the various logical, arithmetic and SLT operations as discussed in the class.
*/

#include <stdio.h>
#include <stdbool.h>

bool overflow = 0;

bool ander(bool a, bool b)
{
    return a & b;
}

bool orer(bool a, bool b)
{
    return a | b;
}

bool adder(bool a, bool b, bool carryin, bool *carryout)
{
    int sum = a + b + carryin;
    if (sum > 1)
        *carryout = 1;
    return sum ? 1 : 0;
}

bool ainvert(bool a, bool code)
{
    if (!code)
    {
        return a;
    }
    else
    {
        return !a;
    }
}

bool binvert(bool b, bool code)
{
    if (!code)
    {
        return b;
    }
    else
    {
        return !b;
    }
}

bool less(bool a, bool b) { return a < b; }

void operation(int code, bool a, bool b)
{
    bool carryin = 0, carryout = 0;
    int temp = 0;
    do
    {
        printf("A invert? (0,1) : ");
        scanf("%d", &temp);
    } while (temp != 0 && temp != 1);

    a = ainvert(a, temp);

    do
    {
        printf("B invert? (0,1) : ");
        scanf("%d", &temp);
    } while (temp != 0 && temp != 1);

    b = binvert(b, temp);

    switch (code)
    {
    case 0:
        printf("AND: %d", ander(a, b));
        break;

    case 1:
        printf("OR: %d", orer(a, b));
        break;

    case 2:
        printf("Set carry? (1/0) :");
        scanf("%d", &temp);
        if (!temp)
            carryin = 0;
        else
            carryin = 1;
        printf("ADD: %d", adder(a, b, carryin, &carryout));
        printf("\nCARRYOUT: %d", carryout);
        if (carryin != carryout)
            overflow = 1;
        break;

    case 3:
        printf("LESS: %d", less(a, b));

    default:
        break;
    }
}

int main()
{

    bool a, b;
    int opcode;

    do
    {
        printf("Enter value of 'a' (0,1): ");
        scanf("%d", &a);
    } while (a != 0 && a != 1);

    do
    {
        printf("Enter value of 'b' (0,1): ");
        scanf("%d", &b);
    } while (b != 0 && b != 1);

    do
    {
        printf("Enter the op code (0,1,2,3): ");
        scanf("%d", &opcode);
    } while (opcode > 3 || opcode < 0);

    operation(opcode, a, b);
    printf("\n");

    return 0;
}