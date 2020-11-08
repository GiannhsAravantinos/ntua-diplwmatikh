#ifndef _RUMPRUN_KVM_HYPERCALL_TMEM_H
#define _RUMPRUN_KVM_HYPERCALL_TMEM_H

int rumprun_utmem();
int kvm_hypercall2(unsigned int nr, unsigned long p1,unsigned long p2);

void test();

#endif
