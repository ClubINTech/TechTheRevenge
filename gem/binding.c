#include <ruby.h>
#include <pthread.h>

#include "asservissement.h"

VALUE object;

pthread_t thread;
etat *e = NULL;

void *
callback()
{
    point *consigne = malloc(sizeof(point));
    point *position = malloc(sizeof(point));
    e = malloc(sizeof(etat));
    e->consigne = consigne;
    e->position = position;

    while(1) {
        apply(e);
    }
    pthread_exit(NULL);
}

static VALUE
t_start(VALUE self)
{
    pthread_create(&thread, NULL, callback, NULL);
    return Qtrue;
}

static VALUE
t_stop(VALUE self)
{
    pthread_cancel(thread);
    return Qtrue;
}

void
Init_revenge()
{
    object = rb_define_class("Revenge", rb_cObject);
    rb_define_method(object, "start", t_start, 0);
    rb_define_method(object, "stop", t_stop, 0);
}
