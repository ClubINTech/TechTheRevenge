#include <stdio.h>
#include <stdlib.h>

typedef struct {
   int x;
   int y;
} point;

typedef struct {
   int x;
} transport;

transport
apply(transport);
