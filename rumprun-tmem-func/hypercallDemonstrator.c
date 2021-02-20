/*This program demonstrats how utmem is to be used by any application.
A PUT and GET operation is performed. After execution as unikernel
user should see <value> in qemu terminal*/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>
#define USEC 1000000

#include "tmem_ops.h"

struct timeval t1;

int main(){
  int result;
  struct timespec tp1,tp2;
  clockid_t clk_id;

  clk_id = CLOCK_REALTIME;


int key = 5;
int value = 15;

int valAsInt;
void *retValue;
size_t *value_lenp;

int ret = tmem_put((void *) &key, sizeof(int), (void *) &value, sizeof(int), NULL);

retValue =  malloc(TMEM_MAX);
ret = tmem_get((void *) &key, sizeof(int), retValue, value_lenp,NULL);

if((int) *value_lenp == sizeof(int)){
  memcpy(&valAsInt,retValue,*value_lenp);
  printf("Value %d\n",valAsInt);
}

free(retValue);

result = clock_gettime(clk_id, &tp2);
result = clock_getres(clk_id, &tp2);


return 0;
}
