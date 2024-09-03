#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

void displayRoutes(int *routes)
{
    printf("Displaying all the routes.\n");
    printf("Please visit the generated link for the list : https://erp.iitkgp.ac.in/InfoCellDetails/resources/external/groupemailfile?file_id=749\n");
}

bool checkBusAvailability(char *busInformation)
{
    printf("Checking Bus infomration.\n");
    return 1;
}

int *searchRoutes(char *location, int routeNo, char *busStop, float date)
{
    printf("Connecting to DB\n");
    printf("Getting information from Table:BusInformation\n");
    printf("Getting information from Table:RouteInformation\n");
    if (checkBusAvailability("Bus Infomration"))
    {
        int *busRouteIDs = calloc(5, sizeof(int));

        for (int i = 5; i > 0; i--)
            busRouteIDs[i - 1] = i;

        displayRoutes(busRouteIDs);
        return busRouteIDs;
    }
    else
    {
        printf("No routes available.\n");
        int *busRouteIDs = calloc(1, sizeof(int));
        return busRouteIDs;
    };
}