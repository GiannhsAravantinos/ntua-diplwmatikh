#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#include "tmem.h"
#include "tmem_ops.h"
int main(){

int key = 5;
int value = 15;

int valAsInt;
void *retValue;
size_t *value_lenp;

int ret = tmem_put_f((void *) &key, sizeof(int), (void *) &value, sizeof(int));

retValue =  malloc(TMEM_MAX);
ret = tmem_get_f((void *) &key, sizeof(int), retValue, value_lenp);

if((int) *value_lenp == sizeof(int)){
  memcpy(&valAsInt,retValue,*value_lenp);
  printf("Value %d\n",valAsInt);
}

free(retValue);
return 0;
}
