#include <sys/types.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>

#include "tmem.h"
#include "tmem_kvm_hypercall.h"

int kvm_hypercall2(unsigned int nr, unsigned long p1,unsigned long p2)
{
  long ret;
  asm volatile(KVM_HYPERCALL
       : "=a"(ret)
       : "a"(nr), "b"(p1), "c"(p2)
       : "memory");
  return ret;
}

//as defined on rumpkernels
typedef unsigned long vaddr_t;
typedef unsigned long paddr_t;
paddr_t vtophys(vaddr_t va){
	return (paddr_t)va;
}

/*Tmem functions, each for every hypercall operation available*/
int tmem_put_f
(void *key_arg, size_t key_len_arg, void *value_arg, size_t value_len_arg){
  /* Local Variable Declarations */
  int ret = 0;
  void *key=NULL, *value=NULL;
  size_t key_len, value_len;

  key_len = key_len_arg;
  value_len = value_len_arg;
  /*Memory allocation */
  if(value_len > TMEM_MAX){
    ret = -1;
    printf("Value too long\n");
    goto put_free;
  }
  if((key = malloc(key_len))==NULL){
    ret = -1; goto put_free;
  }
  if((value = malloc(value_len))==NULL){
    ret = -1; goto put_free;
  }
  memcpy(key, key_arg, key_len);
  memcpy(value, value_arg, value_len);

  /*Structures to be used in hypercall*/
  struct tmem_put_request put_request = {
    .key = (void *) vtophys((vaddr_t) key),
    .key_len = key_len,
    .value = (void *) vtophys((vaddr_t)value),
    .value_len = value_len
  };
  struct tmem_request tmem_request = {
    .put = put_request
  };

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_PUT_OP,vtophys((vaddr_t) &tmem_request));
  if(hc_ret==0 || hc_ret == -EINVAL){// -EINVAL means key was not found
    ret = hc_ret;
  }
  else{
    printf("hypercall ERROR! %d\n",hc_ret);
    ret = -1;
  }

put_free:
  free(value);
  free(key);
  return ret;
}


int tmem_get_f
(void *key_arg, size_t key_len_arg, void *value_arg, size_t *value_lenp_arg){
  /* Local Variable Declarations */
  int ret = 0;
  void *key=NULL, *value=NULL;
  size_t key_len, *value_lenp=NULL;

  key_len = key_len_arg;
  /*Memory allocation */
  if((key = malloc(key_len))==NULL){
    ret = -1; goto get_free;
  }
  if((value = malloc(TMEM_MAX))==NULL){
    ret = -1; goto get_free;
  }
  if((value_lenp = malloc(sizeof(size_t)))==NULL){
    ret = -1; goto get_free;
  }
  memcpy(key, key_arg, key_len);

  /*Structures to be used in hypercall*/
  struct tmem_get_request get_request = {
    .key = (void *) vtophys((vaddr_t) key),
    .key_len = key_len,
    .value = (void *) vtophys((vaddr_t)value),
    .value_lenp = (size_t *) vtophys((vaddr_t) value_lenp)
  };
  struct tmem_request tmem_request = {
    .get = get_request
  };

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_GET_OP,vtophys((vaddr_t) &tmem_request));
  if(hc_ret==0 || hc_ret == -EINVAL){// -EINVAL means key was not found
    ret = hc_ret;
  }
  else{
    printf("hypercall ERROR! %d\n",hc_ret);
    ret = -1;
    goto get_free;
  }
  /*Values copy back to arguments*/
  memcpy(value_lenp_arg, value_lenp, sizeof(size_t));
  memcpy(value_arg, value, *value_lenp);

get_free:
  free(value);
  free(key);
  free((void *) value_lenp);
  return ret;
}


int tmem_invalidate_page_f
(void *key_arg, size_t key_len_arg){
  /* Local Variable Declarations */
  int ret = 0;
  void *key=NULL;
  size_t key_len;

  key_len = key_len_arg;
  /*Memory allocation */
  if((key = malloc(key_len))==NULL){
    ret = -1; goto inval_free;
  }
  memcpy(key, key_arg, key_len);

  /*Structures to be used in hypercall*/
  struct tmem_invalidate_request inval_request = {
    .key = (void *) vtophys((vaddr_t) key),
    .key_len = key_len,
  };
  struct tmem_request tmem_request = {
    .inval = inval_request
  };

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_INVALIDATE_OP,vtophys((vaddr_t) &tmem_request));
  if(hc_ret==0 || hc_ret == -EINVAL){// -EINVAL means key was not found
    ret = hc_ret;
  }
  else{
    printf("hypercall ERROR! %d\n",hc_ret);
    ret = -1; goto inval_free;
  }

inval_free:
  free(key);

  return ret;
}
