#include "rumprun_kvm_hypercall_tmem.h"
#include "custom_alternative.h"

#include<stdio.h>

#define KVM_HC_TMEM   9 //Taken from include/uapi/linux/kvm_para.h !WARNING 9 MAYBE USED
#define X86_FEATURE_VMMCALL     (8*32+15) //Taken from arch/x86/include/asm/kvm_para.h

#define KVM_HYPERCALL \
        ALTERNATIVE(".byte 0x0f,0x01,0xc1", ".byte 0x0f,0x01,0xd9", X86_FEATURE_VMMCALL)

#define DUMMY_MACRO ".byte 0x0f,0x01,0xc1"

void test(){
  printf("All linked fine\n");
}

int kvm_hypercall2(unsigned int nr, unsigned long p1,unsigned long p2)
{
  long ret;
  asm volatile(KVM_HYPERCALL
       : "=a"(ret)
       : "a"(nr), "b"(p1), "c"(p2)
       : "memory");
  return ret;
}
