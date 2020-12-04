#include <sys/syscallargs.h>
#include <sys/malloc.h>
#include <sys/types.h>
#include <sys/systm.h>

int sys_tmem(struct lwp *l, const struct sys_tmem_args *uap,
		register_t *retval)
{
  printf("KERNEL:Hi from kernelspace\n");
  return 0;
}
