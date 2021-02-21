#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>


#include "tmem_ops.h"


#define VALUE_SIZE 1024*1024 //maximum tmem permited
#define NUMBER_OF_TESTS 10

char *getValue(){
  char *ptr;

  if((ptr=malloc(VALUE_SIZE))==NULL){
    printf("ERROR:malloc\n");
    exit(1);
  }
  memset(ptr, 1,VALUE_SIZE-1);
  ptr[VALUE_SIZE-1]='\0';

  return ptr;
}

void calculateResults(struct myTimes *times, long long int *avgHypercall, long long int *avgDriver){
  long long int sumHypercall=0;
  long long int sumDriver=0;

  int i;
  for(i=0;i<NUMBER_OF_TESTS;i++){
    times[i].driverTime -= times[i].hypercallTime;

    sumHypercall += times[i].hypercallTime;
    sumDriver += times[i].driverTime;
  }

  *avgHypercall = sumHypercall / NUMBER_OF_TESTS;
  *avgDriver = sumDriver / NUMBER_OF_TESTS;
  return;
}

int main(){

  char *value;
  char *key="key";
  int value_len = VALUE_SIZE;
  int key_len = strlen(key)+1;
  value = getValue();

  struct myTimes *times;
  times = malloc(NUMBER_OF_TESTS * sizeof(struct myTimes));
  clockid_t clk_id=CLOCK_REALTIME;
  struct timespec tp1,tp2;

  int i,ret;
  for(i=0;i<NUMBER_OF_TESTS;i++){

    clock_gettime(clk_id, &tp1);
    ret = tmem_put((void *) key, (size_t) key_len, (void *) value, (size_t) value_len, &times[i]);
    clock_gettime(clk_id, &tp2);

    if(ret==-1){/*PANIC*/
      printf("ERROR:something went wrong in driver\n");
      return 0;
    }
    times[i].driverTime = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;

    ret = tmem_invalidate_page((void *) key, (size_t) key_len,NULL);
  }

  long long int avgHypercall;
  long long int avgDriver;

  calculateResults(times, &avgHypercall, &avgDriver);

  printf("avgHypercall %lld\navgDriver %lld\n",avgHypercall,avgDriver);

  free(value);
  return 0;
}
