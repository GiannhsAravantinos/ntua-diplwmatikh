#include <stdio.h>
#include <unistd.h>

#include "rumprun_kvm_hypercall_tmem.h"

int main (){
  test();

  printf("Ok, exiting...\n");
  sleep(5);
  return 0;
}
