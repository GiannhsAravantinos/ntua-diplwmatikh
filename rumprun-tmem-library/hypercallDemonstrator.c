#include <stdio.h>
#include <unistd.h>

#include <fcntl.h>
#include <sys/stat.h>


#include "rumprun_kvm_hypercall_tmem.h"


int main (){

  sleep(2);
  /*int res = rumprun_utmem();
  printf("%s %d\n","Ok, hypercall done",res );
  //showAssemblyCode();
  */
  int res = tmem(5);
  return 0;
}
