/*
Name : Rutwik S
Roll Number: 23BCS112
Descreption: Implement the 1-bit ALU capable of performing the various logical, arithmetic and SLT operations as discussed in the class.
*/

#include <iostream>

using namespace std;

class ALU
{
private:
    bool overflow = 0;
    bool a, b;

    bool ander()
    {
        return a & b;
    }

    bool orer()
    {
        return a | b;
    }

    bool adder(bool carryin, bool &carryout)
    {
        int sum = a + b + carryin;
        if (sum > 1)
            carryout = 1;
        return sum ? 1 : 0;
    }

    bool ainvert(bool code)
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

    bool binvert(bool code)
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

    bool lessOper() { return a < b; }

public:
    ALU(bool a, bool b)
    {
        a = a;
        b = b;
    }

    void operation(int code)
    {
        bool carryin = 0, carryout = 0;
        int temp = 0;
        do
        {
            cout << "A invert? (0,1) : ";
            cin >> temp;
        } while (temp != 0 && temp != 1);

        a = ainvert(temp);

        do
        {
            cout << "B invert? (0,1) : ";
            cin >> temp;
        } while (temp != 0 && temp != 1);

        b = binvert(temp);

        switch (code)
        {
        case 0:
            cout << "AND: " << ander();
            break;

        case 1:
            cout << "OR: " << orer();
            break;

        case 2:
            cout << "Set carry? (1/0) :";
            cin >> temp;
            if (!temp)
                carryin = 0;
            else
                carryin = 1;
            cout << "ADD: " << adder(carryin, carryout);
            cout << "\nCARRYOUT: " << carryout;
            if (carryin != carryout)
                overflow = 1;
            break;

        case 3:
            cout << "LESS: " << lessOper();
            break;
        }
    }
};

int main()
{

    bool a, b;
    int opcode;
    do
    {
        cout << "Enter value of 'a' (0,1): ";
        cin >> a;
    } while (a != 0 && a != 1);

    do
    {
        cout << "Enter value of 'b' (0,1): ";
        cin >> b;
    } while (b != 0 && b != 1);

    do
    {
        cout << "Enter the op code (0,1,2,3): ";
        cin >> opcode;
    } while (opcode > 3 || opcode < 0);

    ALU alu1bit(a, b);
    alu1bit.operation(opcode);
    cout << "\n";

    return 0;
}