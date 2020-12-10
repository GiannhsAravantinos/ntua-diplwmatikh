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

  int res = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_PUT_OP,vtophys((vaddr_t) request) );
  printf("KERNEL:hypercall performed %d\n",res);
  printf("KERNEL:seems to be ok so far\n");


  free((void*) key,M_TEMP);
  free((void*) value,M_TEMP);

  free((void*) put_request,M_TEMP);

  free((void*) request,M_TEMP);

  printf("KERNEL:free was ok\n");

}
// netbsd syscall part starts now

int sys_tmem(struct lwp *l, const struct sys_tmem_args *uap,
		register_t *retval)
{
	int val = SCARG(uap, num);

  printf("KERNEL:Hi from kernelspace %d\n",val);

  create_put_request();
  printf("KERNEL:will return\n");
  return 0;
}
