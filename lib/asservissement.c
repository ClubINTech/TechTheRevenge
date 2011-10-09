#include "asservissement.h"

transport
apply(transport t)
{
    t.x = t.x + 1;
    printf("i = %i\n", t.x);
    return t;
}