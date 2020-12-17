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
int perform_put_request(void *key_arg,size_t key_len_arg,void *value_arg,size_t value_len_arg);
int perform_get_request(void *key_arg,size_t key_len_arg,void *value_arg,size_t *value_lenp_arg);
int perform_invalidate_page_request(void *key_arg, size_t key_len_arg);
int get_key(void **key, void *user_key, size_t key_len);

int kvm_hypercall2(unsigned int nr, unsigned long p1,unsigned long p2)
{
  long ret;
  asm volatile(KVM_HYPERCALL
       : "=a"(ret)
       : "a"(nr), "b"(p1), "c"(p2)
       : "memory");
  return ret;
}

/*Actual structs to be used in hypercall*/
static struct tmem_request *request;
static struct tmem_put_request *put_request;
static struct tmem_get_request *get_request;
static struct tmem_invalidate_request *invalidate_request;


int perform_put_request
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

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_PUT_OP,vtophys((vaddr_t) request));
  if(hc_ret==0 || hc_ret == -EINVAL){// -EINVAL means key was not found
    ret = hc_ret;
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
  return ret;
}


int perform_get_request
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

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_GET_OP,vtophys((vaddr_t) request));
  if(hc_ret==0 || hc_ret == -EINVAL){//
    ret = hc_ret;
  }
  else{
    printf("KERNEL:hypercall 138 ERROR! %d\n",hc_ret);
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
  return ret;
}


int perform_invalidate_page_request
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

  /* Perform hypercall */
  int hc_ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_INVALIDATE_OP,vtophys((vaddr_t) request));
  if(hc_ret==0){
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


int get_key
(void **key, void *user_key, size_t key_len){
  int ret = 0;
  void *local_key;

  /*For some reason it has to be at least LONG sized*/
  /*see original tmem implementation for more info https://github.com/etsal/tmem */
  if((local_key = malloc(max(key_len,sizeof(long)),M_TEMP,M_WAITOK))
  ==NULL){
    return ENOMEM;
  }

  /*copy key into kernelspace */
  ret = copyin(user_key, local_key, key_len);
  if(ret){return ret;}

  /* The key needs to be the same every time, so zero out any garbage after it */
  if(sizeof(long)>key_len){
    memset(((uint8_t*) local_key) + key_len, 0, sizeof(long)-key_len);
  }
  *key = local_key;
  return ret;
}



/*actual System Call function implementation*/
int sys_tmem
(struct lwp *l, const struct sys_tmem_args *uap, register_t *retval)
{
  /*syscall arguments*/
	int cmd_arg = SCARG(uap, cmd);
  void *request_arg = SCARG(uap,request);

  /*local values to be exraxted from args*/
  void *key,*value;
  size_t key_len,value_len,*value_lenp;
  struct tmem_request temp_request;

  int ret=0;
  printf("KERNEL EINVAL %d",EINVAL);goto syscall_out;
  key=value=value_lenp=NULL;/*so that free is never on uninitialised pointers*/
  /*in any case there must be a request argument*/
  copyin(request_arg, &temp_request, sizeof(struct tmem_request));


  switch(cmd_arg){

    case TMEM_PUT:/*we deal with a PUT request*/
      //printf("KERNEL:got a PUT request\n");

      /*lets get key first*/
      key_len = temp_request.put.key_len;
      if(get_key(&key, temp_request.put.key, key_len)){
        printf("KERNEL:ERROR bad key\n");
        ret = -1; goto syscall_out;
      }

      /*now lets get value*/
      value_len = temp_request.put.value_len;
      if(value_len>TMEM_MAX){
        printf("KERNEL:ERROR value length is too long\n");
        ret = -1; goto syscall_out;
      }
      if((value=malloc(value_len, M_TEMP, M_WAITOK))==NULL){
        ret = ENOMEM;goto syscall_out;
      }
      if(copyin(temp_request.put.value, value, value_len)){
        printf("KERNEL:ERROR bad value\n");
        ret = -1; goto syscall_out;
      }

      /*perform hvm hypercall*/
      ret = perform_put_request(key,key_len,value,value_len);
      if(ret !=0 && ret!= -EINVAL){
        printf("KERNEL:ERROR no hypercall\n");
        ret = -1; goto syscall_out;
      }

      free(key,M_TEMP);
      free(value,M_TEMP);
      goto syscall_out;
      break;


    case TMEM_GET:/*we deal with a GET request*/
      //printf("KERNEL:got a GET request\n");
      /*lets get key first*/

      key_len = temp_request.get.key_len;
      if(get_key(&key, temp_request.get.key, key_len)){
        printf("KERNEL:ERROR bad key\n");
        ret = -1; goto syscall_out;
      }

      /*now lets prepare value*/
      if((value_lenp = malloc(sizeof(size_t),M_TEMP,M_WAITOK))
      ==NULL){
        ret = ENOMEM; goto syscall_out;
      }
      if((value=malloc(TMEM_MAX, M_TEMP, M_WAITOK))==NULL){
        ret = ENOMEM; goto syscall_out;
      }

      /*perform hvm hypercall*/
      ret =perform_get_request(key,key_len,value,value_lenp);
      if(ret !=0 && ret!= -EINVAL){
        printf("KERNEL:ERROR no hypercall\n");
        ret = -1; goto syscall_out;
      }

      /*copy value/value_lenp to userspace*/
      if(ret == 0){// only if key was found
        if(copyout(value_lenp, temp_request.get.value_lenp, sizeof(size_t))){
          printf("KERNEL:ERROR bad len_p\n");
          ret = -1; goto syscall_out;
        }
        if(copyout(value, temp_request.get.value, *value_lenp)){
          printf("KERNEL:ERROR bad value\n");
          ret = -1; goto syscall_out;
        }
      }

      free(key,M_TEMP);
      free(value,M_TEMP);
      free(value_lenp,M_TEMP);
      goto syscall_out;
      break;


    case TMEM_INVAL:/*we deal with an INVAL request*/
      //printf("KERNEL:got an INVAL request\n");

      /*lets get key*/
      key_len = temp_request.inval.key_len;
      if(get_key(&key, temp_request.inval.key, key_len)){
        printf("KERNEL:ERROR bad key\n");
        ret = -1; goto syscall_out;
      }

      /*perform hvm hypercall*/
      if(perform_invalidate_page_request(key,key_len)){
        printf("KERNEL:ERROR no hypercall\n");
        ret = -1; goto syscall_out;
      }

      free(key,M_TEMP);
      goto syscall_out;
      break;

    default:
      printf("KERNEL:ERROR unknow tmem operation\n");
      break;
  }

syscall_out:
  //printf("KERNEL: syscall exits now\n");

  return ret;
}
