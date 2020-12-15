#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <fcntl.h>
#include <sys/stat.h>
#include <string.h>

#include "rumprun_kvm_hypercall_tmem.h"


int main (){

  sleep(2);
  /*int res = rumprun_utmem();
  printf("%s %d\n","Ok, hypercall done",res );
  //showAssemblyCode();
  */
  int key = 30;
  int value = 130;

  void *retValue;
  size_t *value_lenp;
  int valueAsNum;
  retValue = malloc(1024*1024);
  value_lenp = malloc(sizeof(size_t));

  int i;
  for(i=0;i<10;i++){
    tmem_put((void *) &key, sizeof(int), (void *) &value, sizeof(int));
    key++;
    value++;
  }

  key=30;
  for(i=0;i<10;i++){
    tmem_get((void *) &key, sizeof(int), retValue, value_lenp);
    if(*value_lenp != sizeof(int)){
      printf("USER:ERROR, value len\n");
      break;
    }
    memcpy(&valueAsNum, retValue, *value_lenp);
    printf ("USER: key %d value %d\n",key,valueAsNum);
    key++;
  }

  free(retValue);
  free(value_lenp);
  return 0;
}
