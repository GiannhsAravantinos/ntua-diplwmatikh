#include <stdio.h>
#include <unistd.h>

#include "rumprun_kvm_hypercall_tmem.h"

int main (){
  test();


  sleep(5);
  int res = rumprun_utmem();
  printf("%s %d\n","Ok, hypercall done",res );
  return 0;
}
