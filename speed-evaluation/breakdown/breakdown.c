#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>


#include "tmem_ops.h"


#define VALUE_SIZE 1024*1024 //maximum tmem permited
#define NUMBER_OF_TESTS 10000

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
    if(times[i].hypercallTime<0 || times[i].driverTime<0){
      printf("Error, neg value %lld %lld\n",times[i].hypercallTime, times[i].driverTime);
      continue;
    }

    times[i].hypercallTime /= 1000; /* i only car about μs*/
    times[i].driverTime /= 1000;

    if(i%100==0){
      printf("Sums %lld %lld\n",sumHypercall,sumDriver);
    }

    times[i].driverTime -= times[i].hypercallTime;
    if(times[i].driverTime<0){
      printf("ERROR:not good measurement");
      exit(0);
    }

    sumHypercall += times[i].hypercallTime;
    sumDriver += times[i].driverTime;
  }

  *avgHypercall = sumHypercall / NUMBER_OF_TESTS;
  *avgDriver = sumDriver / NUMBER_OF_TESTS;
  return;
}

int main(){
  printf("%lld :%lld\n",sizeof(long long int), sizeof(long int));

  char *value;
  char *key="key";
  size_t value_len = VALUE_SIZE;
  size_t value_lenp;
  int key_len = strlen(key)+1;
  value = getValue();

  struct myTimes *times;
  times = malloc(NUMBER_OF_TESTS * sizeof(struct myTimes));
  clockid_t clk_id=CLOCK_REALTIME;
  struct timespec tp1,tp2;

  int i,ret;
  /*Test put operationg*/
  for(i=0;i<NUMBER_OF_TESTS;i++){

    if(i%100==0){
      printf("%d iteration\n",i);
    }

    clock_gettime(clk_id, &tp1);
    ret = tmem_put((void *) key, (size_t) key_len, (void *) value, value_len, &times[i]);
    clock_gettime(clk_id, &tp2);

    if(ret==-1){/*PANIC*/
      printf("ERROR:Putsomething went wrong in driver\n");
      return 0;
    }
    times[i].driverTime = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;

    ret = tmem_invalidate_page((void *) key, (size_t) key_len,NULL);
  }

  long long int avgHypercallPut;
  long long int avgDriverPut;

  calculateResults(times, &avgHypercallPut, &avgDriverPut);

  /*test get operation*/
  int j;
  tmem_put((void *) key, (size_t) key_len, (void *) value, value_len, NULL);
  for(i=0;i<NUMBER_OF_TESTS;i++){

    if(i%100==0){
      printf("%d iteration\n",i);
    }

    clock_gettime(clk_id, &tp1);
    ret = tmem_get((void *) key, (size_t) key_len, (void *) value, &value_lenp, &times[i]);
    clock_gettime(clk_id, &tp2);

    if(ret==-1 || (int) value_lenp!=value_len){/*PANIC*/
      printf("ERROR:Getsomething went wrong in driver\n");
      return 0;
    }
    times[i].driverTime = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;
  }
  long long int avgHypercallGet;
  long long int avgDriverGet;

  calculateResults(times, &avgHypercallGet, &avgDriverGet);

  printf("Size of Value %d\n", value_len);
  printf("Put avgHypercall %lld avgDriver %lld\n",avgHypercallPut,avgDriverPut);
  printf("Get avgHypercall %lld avgDriver %lld\n",avgHypercallGet,avgDriverGet);

  free(value);
  return 0;
}
