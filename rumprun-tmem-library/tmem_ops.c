#include <stdio.h>

#include "tmem_ops.h"
#include "tmem.h"

/* This file contatins the implementation of 3 tmem kvm operations*/
/*PUT, GET, INVAL*/
/*Every functions calls the tmem system call, which in turn performs
the hypercall*/

int tmem_put(void *key, size_t key_len, void *value, size_t value_len){
  int ret=0;

  /*System call structures*/
  struct tmem_put_request put_request = {
    .key = key,
    .key_len = key_len,
    .value = value,
    .value_len = value_len
  };
  struct tmem_request tmem_request = {
    .put = put_request
  };

  if(value_len > TMEM_MAX){/*tmem works on 1 mega byte of value per operation*/
    ret = -1;
    printf("Value too long\n");
    goto put_out;
  }
  /*Actuall system call call*/
  ret = tmem(TMEM_PUT,(void *) &tmem_request);

put_out:
  return ret;
}


int tmem_get
(void *key, size_t key_len, void *value, size_t *value_lenp){
  int ret=0;

  /*System call structures*/
  struct tmem_get_request get_request = {
    .key = key,
    .key_len = key_len,
    .value = value,
    .value_lenp = value_lenp
  };
  struct tmem_request tmem_request = {
    .get = get_request
  };
  /*Actuall system call call*/
  ret = tmem(TMEM_GET,(void *) &tmem_request);
  return ret;
}

int tmem_inval
(void *key, size_t key_len){
  int ret=0;

  /*System call structures*/
  struct tmem_invalidate_request inval_request = {
    .key = key,
    .key_len = key_len,
  };
  struct tmem_request tmem_request = {
    .inval = inval_request
  };
  /*Actuall system call call*/
  ret = tmem(TMEM_INVAL,(void *) &tmem_request);

  return ret;
}
