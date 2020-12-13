#include <sys/syscallargs.h>
#include <sys/malloc.h>
#include <sys/types.h>
#include <sys/systm.h>
#include <sys/malloc.h>

#include <uvm/uvm_extern.h>
#include <sys/param.h>

#include "tmem_kernel.h"

//declaration of functions
int kvm_hypercall2(unsigned int nr, unsigned long p1,unsigned long p2);
int create_put_request(void *key_arg,size_t key_len_arg,void *value_arg,size_t value_len_arg);
int create_get_request(void *key_arg,size_t key_len_arg,void *value_arg,size_t *value_lenp_arg);
int create_invalidate_page_request(void *key_arg, size_t key_len_arg);


int kvm_hypercall2(unsigned int nr, unsigned long p1,unsigned long p2)
{
  long ret;
  asm volatile(KVM_HYPERCALL
       : "=a"(ret)
       : "a"(nr), "b"(p1), "c"(p2)
       : "memory");
  return ret;
}

static struct tmem_request *request;
static struct tmem_put_request *put_request;
static struct tmem_get_request *get_request;
static struct tmem_invalidate_request *invalidate_request;


int create_put_request
(void *key_arg,size_t key_len_arg,void *value_arg,size_t value_len_arg){
  /* Declare local variables/pointers */
  void *key, *value;
  size_t key_len, value_len;
  int ret;

  key_len = key_len_arg;
  value_len = value_len_arg;
  /* Allocate kernel memory (redundunt in unikernell, though)*/
  if((key = malloc(key_len, M_TEMP, M_WAITOK))==NULL){
    return ENOMEM;
  }
  if((value = malloc(value_len, M_TEMP, M_WAITOK))==NULL){
    return ENOMEM;
  }
  memcpy(key,key_arg,key_len);
  memcpy(value,value_arg,value_len);

  /* Request structrures allocation*/
  if((put_request = malloc(sizeof(struct tmem_put_request), M_TEMP, M_WAITOK))
  ==NULL){
    return ENOMEM;
  }
  put_request->key = (void *) vtophys((vaddr_t)key);
  put_request->key_len = key_len;
  put_request->value = (void *) vtophys((vaddr_t)value);
  put_request->value_len = value_len;

  if((request = malloc(sizeof(struct tmem_request), M_TEMP, M_WAITOK))
  ==NULL){
    return ENOMEM;
  }
  request->put = *put_request;
  printf("KERNEL:mallocs done\n");

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_PUT_OP,vtophys((vaddr_t) request));
  if(hc_ret==0){
    printf("KERNEL:hypercall OK!\n");
    ret = 0;
  }
  else{
    printf("KERNEL:hypercall ERROR! %d\n",hc_ret);
    ret = -1;
    goto mem_free_put;
  }

mem_free_put:
  free(key, M_TEMP);
  free(value, M_TEMP);

  free((void*) put_request, M_TEMP);
  free((void*) request, M_TEMP);

  printf("KERNEL:free was ok\n");
  return ret;
}


int create_get_request
(void *key_arg,size_t key_len_arg,void *value_arg,size_t *value_lenp_arg){
  /* Declare local variables/pointers */
  void *key, *value;
  size_t key_len, *value_lenp;
  int ret;

  key_len = key_len_arg;

  /* Allocate kernel memory (redundunt in unikernell, though)*/
  if((key = malloc(key_len, M_TEMP, M_WAITOK))
  ==NULL){
    return ENOMEM;
  }
  if((value = malloc(TMEM_MAX, M_TEMP, M_WAITOK))
  ==NULL){
    return ENOMEM;
  }
  if((value_lenp = malloc(sizeof(size_t), M_TEMP, M_WAITOK))
  ==NULL){
    return ENOMEM;
  }
  memcpy(key,key_arg,key_len);

  /* Request structrures allocation*/
  if((get_request = malloc(sizeof(struct tmem_get_request), M_TEMP, M_WAITOK))
  ==NULL){
    return ENOMEM;
  }
  get_request->key = (void *) vtophys((vaddr_t) key);
  get_request->key_len = key_len;
  get_request->value = (void *) vtophys((vaddr_t) value);
  get_request->value_lenp = (size_t *) vtophys((vaddr_t) value_lenp);

  if((request = malloc(sizeof(struct tmem_request), M_TEMP, M_WAITOK))
  ==NULL){
    return ENOMEM;
  }
  request->get = *get_request;

  printf("KERNEL:mallocs done\n");

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_GET_OP,vtophys((vaddr_t) request) );
  if(hc_ret==0){
    printf("KERNEL:hypercall OK!\n");
    ret = 0;
  }
  else{
    printf("KERNEL:hypercall ERROR! %d\n",hc_ret);
    ret = -1;
    goto mem_free_get;
  }

  /*Values copy back to arguments*/
  memcpy(value_lenp_arg, value_lenp, sizeof(size_t));
  memcpy(value_arg, value, *value_lenp);
  //NOTE! I think there is no need to copy key back

mem_free_get:
  free(key, M_TEMP);
  free(value, M_TEMP);
  free((void *) value_lenp, M_TEMP);

  free((void *) get_request, M_TEMP);
  free((void *) request, M_TEMP);

  printf("KERNEL:free was ok\n");
  return ret;
}


int create_invalidate_page_request
(void *key_arg, size_t key_len_arg){
  /* Declare local variables/pointers */
  void *key;
  size_t key_len;
  int ret;

  key_len = key_len_arg;
  /* Allocate kernel memory (redundunt in unikernell, though)*/
  if((key = malloc(key_len,M_TEMP, M_WAITOK))==NULL){
    return ENOMEM;
  }
  memcpy(key, key_arg, key_len);

  /* Request structrures allocation*/
  if((invalidate_request=malloc(sizeof(struct tmem_invalidate_request), M_TEMP, M_WAITOK))
  ==NULL){
    return ENOMEM;
  }
  invalidate_request->key = (void *)vtophys((vaddr_t) key);
  invalidate_request->key_len = key_len;

  if((request=malloc(sizeof(struct tmem_request), M_TEMP, M_WAITOK))
    ==NULL){
      return ENOMEM;
    }
  request->inval = *invalidate_request;
  printf("KERNEL:mallocs done\n");

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_INVALIDATE_OP,vtophys((vaddr_t) request));
  if(hc_ret==0){
    printf("KERNEL:hypercall OK!\n");
    ret = 0;
  }
  else{
    printf("KERNEL:hypercall ERROR! %d\n",hc_ret);
    ret = -1;
    goto mem_free_inval;
  }

mem_free_inval:
  free(key,M_TEMP);

  free(invalidate_request,M_TEMP);
  free(request,M_TEMP);
  return ret;
}


// netbsd syscall part starts now
int sys_tmem
(struct lwp *l, const struct sys_tmem_args *uap, register_t *retval)
{
	int cmd_arg = SCARG(uap, cmd);
  //void *request_arg = SCARG(uap,request);


  switch(cmd_arg){
    case TMEM_GET:
      printf("KERNEL:got a GET request\n");
      break;
    case TMEM_PUT:
      printf("KERNEL:got a PUT request\n");
      break;
    case TMEM_INVAL:
      printf("KERNEL:got an INVAL request\n");
      break;
    default:
      printf("ERROR unknow tmem operation\n");
      break;
  }

  /*int key = 5;
  int value = 10;

  int retVal = create_put_request
  ((void *) &key,sizeof(int),(void *) &value,sizeof(int));
  printf("PUT %d\n",retVal);


  void *value2 = malloc(TMEM_MAX, M_TEMP, M_WAITOK);
  size_t *value_lenp = malloc(sizeof(size_t), M_TEMP, M_WAITOK);

  retVal = create_get_request
  ((void *) &key,sizeof(int),value2 ,value_lenp);
  printf("GET %d\n",retVal);

  printf("Value length %d\n",(int) *value_lenp);
  if((int) *value_lenp == sizeof(int)){
    int returnVal;
    memcpy((void *) &returnVal, value2, sizeof(int));
    printf("Value %d\n",returnVal);
  }
  free(value2, M_TEMP);
  free(value_lenp, M_TEMP);

  printf("KERNEL:will return\n");*/
  return 0;
}
