#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#include "asservissement.h"

void *
callback()
{
    point consigne = { 10, 0, 0 };
    point position = { 0, 0, 0 };
    etat e = { &consigne, &position };
    while(1) {
        apply(&e);
    }
    pthread_exit(NULL);
}

int
main()
{
    pthread_t thread1;
    pthread_create(&thread1, NULL, callback, NULL);
    pthread_join(thread1, NULL);
    return 0;
}
