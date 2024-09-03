#include <stdio.h>
#include <stdbool.h>
#include "heads/bookBuses.h"
#include "heads/complain.h"
#include "heads/searchRoutes.h"

int main()
{
    int choice = 0;
    printf(
        "Please Choose:\n"
        "1 : Search Routes\n"
        "2 : Book the bus\n"
        "3 : Complain\n"
        "Enter you choice: ");
    scanf("%d", &choice);

    char location[100], busStop[100], details[100], bank[100], complainQuery[300];
    long long routeNo;

    switch (choice)
    {
    case 1:
        printf("Enter Location : ");
        scanf("%s", &location);
        printf("Enter Route Number : ");
        scanf("%d", &routeNo);
        printf("Enter Bus stop : ");
        scanf("%s", &busStop);

        printf("\n\"\"Searching routes.\"\"\"\n");

        searchRoutes(location, routeNo, busStop, 1997);
        break;

    case 2:
        printf("Enter bus details (Name): ");
        scanf("%s", &details);
        printf("Enter bank details (Name): ");
        scanf("%s", &bank);

        printf("\n\n\"\"\"Bus booking.\"\"\"\n");

        bookBuses(details, bank);
        break;

    case 3:
        printf("Enter you query : ");
        scanf(" %[^\n]", &complainQuery);
        printf("\n\"\"Complaining\"\"\"\n");

        complain(complainQuery);
        break;

    default:
        printf("Please choose correctly.");
        break;
    }
    return 0;
}