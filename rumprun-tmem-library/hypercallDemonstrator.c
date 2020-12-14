#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <fcntl.h>
#include <sys/stat.h>
#include <string.h>


#include "rumprun_kvm_hypercall_tmem.h"
#include "tmem.h"

int main (){

  sleep(2);
  /*int res = rumprun_utmem();
  printf("%s %d\n","Ok, hypercall done",res );
  //showAssemblyCode();
  */
  int key = 30;
  int value = 666;

  void *retValue;
  retValue = malloc(TMEM_MAX);
  size_t value_lenp;

  struct tmem_request req1,req2;
  struct tmem_put_request put_req;
  struct tmem_get_request get_req;

  put_req.key=(void * ) &key;
  put_req.key_len = sizeof(int);
  put_req.value = (void *) &value;
  put_req.value_len = sizeof(int);

  req1.put = put_req;

  int res = tmem(TMEM_PUT,(void * ) &req1);
  printf("USER: return from syscall\n");
  get_req.key=(void * ) &key;
  get_req.key_len = sizeof(int);
  get_req.value = retValue;
  get_req.value_lenp = &value_lenp;

  req2.get = get_req;
  res = tmem(TMEM_GET, (void *) &req2);

  if(value_lenp==sizeof(int)){
    printf("Value len_p %ld\n",value_lenp);
    memcpy(&value, retValue, sizeof(int));
    printf("Value %d\n", value);
  }

  //res = tmem(6);
  free(retValue);
  return 0;
}
