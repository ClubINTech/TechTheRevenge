#include "ruby.h"
#include "main.h"

VALUE object;

// static VALUE
// t_read(VALUE self, VALUE addr, VALUE length)
// {
//     int len = FIX2INT(length);
//     unsigned char result[len];
//     int err = i2c_read(adaptateur_i2c, (unsigned char) FIX2INT(addr), result, len);
//
//     if (err > 0)
//         return Qfalse;
//     else
//         return rb_str_new(result, len);
// }

static VALUE
t_start(VALUE self)
{
    pthread_t thread1;
    pthread_create(&thread1, NULL, callback, NULL);
    return Qtrue;
}

void
Init_revenge()
{
    object = rb_define_class("Revenge", rb_cObject);
    rb_define_method(object, "start", t_start, 0);
    // rb_define_method(rb_cI2C, "read", t_read, 2);
}
