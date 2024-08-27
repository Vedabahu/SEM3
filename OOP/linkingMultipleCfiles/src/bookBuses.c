#include <stdio.h>
#include <stdbool.h>

void payment(char *bankDetails, bool refund)
{
    printf("Making transaction.\n");
    if (refund)
        printf("Money Refunded.\n");
    printf("Transaction Complete.\n");
}

void refund()
{
    printf("Refunding the money. Calling patment gateway.\n");
}

bool cancelBuses(char *busDetails)
{
    printf("BOOKING: Cancelling bus.");
    refund();
    return true;
}

char *bookBuses(char *busDetails, char *bankDetails)
{
    bool cancelTicket = true;
    printf("BOOKING: Connecting to DB\n");
    printf("BOOKING: Getting information from Table:BusInformation\n");
    printf("BOOKING: Getting information from Table:RouteInformation\n");
    printf("BOOKING: Booking bus.\n");

    if (cancelBuses)
    {
        cancelBuses(busDetails);
        payment(bankDetails, true);
        return "Ticket/Bill";
    }

    payment(bankDetails, false);

    return "Ticket/Bill";
}