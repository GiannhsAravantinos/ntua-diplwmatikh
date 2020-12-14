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
  int key = 30;
  int value;
  struct tmem_request req;
  struct tmem_put_request put_req;

  put_req.key=(void * ) &key;
  put_req.key_len = sizeof(int);
  put_req.value = (void *) &value;
  put_req.value_len = sizeof(int);
  
  req.put = put_req;

  int res = tmem(TMEM_PUT,(void * ) &req);
  //res = tmem(6);
  return 0;
}
