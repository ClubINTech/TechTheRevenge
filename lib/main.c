#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#include "asservissement.h"

void *
callback()
{
    transport t = { 0 };
    while(1) {
        t = apply(t);
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
