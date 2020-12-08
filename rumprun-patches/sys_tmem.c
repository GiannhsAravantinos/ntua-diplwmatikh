#include <sys/syscallargs.h>
#include <sys/malloc.h>
#include <sys/types.h>
#include <sys/systm.h>

#include <uvm/uvm_extern.h>
#include <sys/param.h>

int sys_tmem(struct lwp *l, const struct sys_tmem_args *uap,
		register_t *retval)
{
	//syscallarg(int) num;
	int val = SCARG(uap, num);

  printf("KERNEL:Hi from kernelspace %d\n",val);

	int val2 = 10;
	int *point;
	point = &val2;

	vaddr_t virtAddress = (vaddr_t) point;
	printf("KERNEL:virtAdd created\n");
	
	paddr_t *physAddress=NULL;
	printf("KERNEL:physAdd declared\n");

	pmap_t my_map = pmap_create();
	printf("KERNEL:map created\n");

	bool retVal = pmap_extract(my_map, virtAddress, physAddress);
	if(retVal){
		printf("KERNEL:extract WORKED!\n");
	}
	else{
		printf("KERNEL:extract didnt work\n");
	}
  return 0;


}
