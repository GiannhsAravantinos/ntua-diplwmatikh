#include <sys/syscallargs.h>
#include <sys/malloc.h>
#include <sys/types.h>
#include <sys/systm.h>
#include <sys/malloc.h>

#include <uvm/uvm_extern.h>
#include <sys/param.h>

#include "tmem_header.h"

//declaration of functions
int kvm_hypercall2(unsigned int nr, unsigned long p1,unsigned long p2);
void create_put_request(void);
void create_get_request(void);



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

void create_put_request(void){
  int *key;
  int *value;

  key = malloc(sizeof(int), M_TEMP, M_WAITOK);
  value = malloc(sizeof(int), M_TEMP, M_WAITOK);
  *key = 5;
  *value = 10;
  int key_len = sizeof(int);
  int value_len = sizeof (int);

  put_request = malloc(sizeof(struct tmem_put_request), M_TEMP, M_WAITOK);

  put_request->key = (void *) vtophys((vaddr_t)key);
  put_request->key_len = (size_t) key_len;
  put_request->value = (void *) vtophys((vaddr_t)value);
  put_request->value_len = (size_t) value_len;

  request = malloc(sizeof(struct tmem_request), M_TEMP, M_WAITOK);
  request->put = *put_request;

  printf("KERNEL:mallocs done\n");

  int res = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_PUT_OP,vtophys((vaddr_t) request) );
  printf("KERNEL:hypercall put performed %d\n",res);



  free((void*) key,M_TEMP);
  free((void*) value,M_TEMP);

  free((void*) put_request,M_TEMP);
  free((void*) request,M_TEMP);

  printf("KERNEL:free was ok\n");
  return;
}

void create_get_request(void){
  int *key,key_len;
  void *value;
  size_t *value_lenp;

  key = malloc(sizeof(int), M_TEMP, M_WAITOK);
  *key = 5;
  key_len = sizeof(int);

  value_lenp = malloc(sizeof(size_t), M_TEMP, M_WAITOK);
  value = malloc(TMEM_MAX, M_TEMP, M_WAITOK);// too much memory but ok

  get_request = malloc(sizeof(struct tmem_get_request), M_TEMP, M_WAITOK);
  get_request->key = (void *) vtophys((vaddr_t) key);
  get_request->key_len = (size_t) key_len;
  get_request->value = (void *) vtophys((vaddr_t) value);
  get_request->value_lenp = (size_t *) vtophys((vaddr_t) value_lenp);

  request = malloc(sizeof(struct tmem_request), M_TEMP, M_WAITOK);
  request->get = *get_request;

  printf("KERNEL:mallocs done\n");

  int res = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_GET_OP,vtophys((vaddr_t) request) );
  printf("KERNEL:hypercall get performed %d\n",res);

  printf("Value length %d\n",(int) *value_lenp);
  if((int) *value_lenp == sizeof(int)){
    int returnVal;
    memcpy((void *) &returnVal, value, sizeof(int));
    printf("Value %d\n",returnVal);
  }

  free((void *) key, M_TEMP);
  free((void *) value, M_TEMP);
  free((void *) value_lenp, M_TEMP);

  free((void *) get_request, M_TEMP);
  free((void *) request, M_TEMP);

  printf("KERNEL:free was ok\n");
  return;
}


// netbsd syscall part starts now

int sys_tmem(struct lwp *l, const struct sys_tmem_args *uap,
		register_t *retval)
{
	int val = SCARG(uap, num);

  printf("KERNEL:Hi from kernelspace %d\n",val);

  create_put_request();
  create_get_request();

  printf("KERNEL:will return\n");
  return 0;
}
