#include <stdio.h>
#include <unistd.h>

#include <fcntl.h>
#include <sys/stat.h>


#include "rumprun_kvm_hypercall_tmem.h"
#include "tmem.h"

int main (){

  sleep(2);
  /*int res = rumprun_utmem();
  printf("%s %d\n","Ok, hypercall done",res );
  //showAssemblyCode();
  */
  long b=15;
  int res = tmem(TMEM_PUT,(void * ) &b);
  res = tmem(TMEM_GET,(void * ) &b);
  res = tmem(TMEM_INVAL,(void * ) &b);
  //res = tmem(6);
  return 0;
}
