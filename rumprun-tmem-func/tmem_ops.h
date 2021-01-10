#ifndef _TMEM_OPS_H
#define _TMEM_OPS_H

#include "tmem.h"

/* declaraton of 3 tmem kvm operations*/
/*PUT, GET, INVAL*/
int tmem_put (void *key_arg, size_t key_len_arg, void *value_arg, size_t value_len_arg);
int tmem_get (void *key_arg, size_t key_len_arg, void *value_arg, size_t *value_lenp_arg);
int tmem_invalidate_page (void *key_arg, size_t key_len_arg);
#endif
