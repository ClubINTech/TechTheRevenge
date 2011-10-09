#include "asservissement.h"

void
apply(etat *e)
{
    printf("position = %lf, ", e->position->x);
    printf("consigne = %lf\n", e->consigne->x);
    sleep(1);
}