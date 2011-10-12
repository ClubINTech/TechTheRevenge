#include "asservissement.h"

void
apply(etat *etat)
{
    printf("position = %lf, ", etat->position->x);
    printf("consigne = %lf\n", etat->consigne->x);
    sleep(1);
}