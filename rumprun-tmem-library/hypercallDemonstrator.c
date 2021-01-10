/*This program demonstrats how utmem is to be used by any application.*/
/*This program is unaware whether tmem is perfored using a system call,
or a function call*/
/*It perfors 100 PUT requests, followng 100 GET requests and then 100
INVAL requests. Finally checks that all INVAL requests went right*/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <fcntl.h>
#include <sys/stat.h>
#include <string.h>
#include <errno.h>


#include "tmem_ops.h"

#define NUM_OF_TEST 100
int main (){

  sleep(2);
  /*int res = rumprun_utmem();
  printf("%s %d\n","Ok, hypercall done",res );
  //showAssemblyCode();
  */
  int key = 30;
  int value = 130;

  int temp_ret;
  void *retValue;
  size_t *value_lenp;
  int valueAsNum;
  retValue = malloc(1024*1024);
  value_lenp = malloc(sizeof(size_t));

  int i;
  for(i=0;i<NUM_OF_TEST;i++){
    tmem_put((void *) &key, sizeof(int), (void *) &value, sizeof(int));
    key++;
    value++;
  }

  key=30;
  for(i=0;i<NUM_OF_TEST;i++){
    tmem_get((void *) &key, sizeof(int), retValue, value_lenp);
    if(*value_lenp != sizeof(int)){
      printf("USER:ERROR, value len\n");
      break;
    }
    memcpy(&valueAsNum, retValue, *value_lenp);
    printf ("USER: key %d value %d\n",key,valueAsNum);
    key++;
  }

  key = 30;
  for(i=0;i<NUM_OF_TEST;i++){
    tmem_inval((void *) &key, sizeof(int));
    temp_ret = tmem_get((void *) &key, sizeof(int), retValue, value_lenp);

    if(temp_ret ==  -EINVAL){
      printf("USER: key %d was invalidated correctly\n",key);
    }
    key++;
  }


  free(retValue);
  free(value_lenp);


  return 0;
}
