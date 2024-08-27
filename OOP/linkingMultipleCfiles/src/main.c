#include <stdio.h>
#include <stdbool.h>
#include "heads/bookBuses.h"
#include "heads/complain.h"
#include "heads/searchRoutes.h"

int main()
{
    printf("\n\"\"Searching routes.\"\"\"\n");
    searchRoutes("Dharwad", 32, "Devagiri", 100000072);
    printf("\n\n\"\"\"Bus booking.\"\"\"\n");
    bookBuses("Details", "ICICI");
    printf("\n\n\"\"\"Complaining\"\"\"\n");
    complain("I am angry.");
    printf("\n");
    return 0;
}