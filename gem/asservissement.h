#include <stdio.h>
#include <stdlib.h>

typedef struct {
    double x;
    double y;
    double angle;
} point;

typedef struct {
    point *consigne;
    point *position;
} etat;

void
apply(etat *);
