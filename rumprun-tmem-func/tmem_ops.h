#ifndef _TMEM_OPS_H
#define _TMEM_OPS_H


int tmem_put_f (void *key_arg, size_t key_len_arg, void *value_arg, size_t value_len_arg);
int tmem_get_f (void *key_arg, size_t key_len_arg, void *value_arg, size_t *value_lenp_arg);
int tmem_invalidate_page_f (void *key_arg, size_t key_len_arg);
#endif
