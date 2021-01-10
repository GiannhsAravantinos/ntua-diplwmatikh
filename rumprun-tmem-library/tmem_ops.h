#ifndef _RUMPRUN_KVM_HYPERCALL_TMEM_H
#define _RUMPRUN_KVM_HYPERCALL_TMEM_H


/* declaraton of 3 tmem kvm operations*/
/*PUT, GET, INVAL*/
int tmem_put(void *key, size_t key_len, void *value, size_t value_len);
int tmem_get(void *key, size_t key_len, void *value, size_t *value_lenp);
int tmem_inval(void *key, size_t key_len);


#endif
