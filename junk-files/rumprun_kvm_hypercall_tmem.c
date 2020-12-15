#include "rumprun_kvm_hypercall_tmem.h"

#include<stdio.h>

#define KVM_HC_TMEM   9 //Taken from include/uapi/linux/kvm_para.h !WARNING 9 MAYBE USED
#define X86_FEATURE_VMMCALL     (8*32+15) //Taken from arch/x86/include/asm/kvm_para.h
#define PV_TMEM_NON_EXISTANT_OP 100 //Not declared in /include/tmem/tmem_ops.h

#define KVM_HYPERCALL \
        ALTERNATIVE(".byte 0x0f,0x01,0xc1", ".byte 0x0f,0x01,0xd9", X86_FEATURE_VMMCALL)

#define DUMMY_MACRO ".byte 0x0f,0x01,0xc1"


int kvm_hypercall2(unsigned int nr, unsigned long p1,unsigned long p2)
{
  long ret;
  asm volatile(KVM_HYPERCALL
       : "=a"(ret)
       : "a"(nr), "b"(p1), "c"(p2)
       : "memory");
  return ret;
}


int rumprun_utmem(){
  int ret = -1;

  unsigned long trashAddress = 1<<16;
  ret = kvm_hypercall2(KVM_HC_TMEM,PV_TMEM_NON_EXISTANT_OP,trashAddress);

  return ret;
}

void test(){
  printf("All linked fine\n");
}

void showAssemblyCode(){
  printf("Macro:\n%s\n",KVM_HYPERCALL);
}
