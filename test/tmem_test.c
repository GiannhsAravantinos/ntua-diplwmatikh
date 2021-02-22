#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/ioctl.h>


#include "tmem.h"

#include <time.h>
#define NSEC 1000000000
struct myTimes{
  long int redisTime;
  long int driverTime;
  long int hypercallTime;
};/*everything is in nanoseconds*/

#define VALUE_SIZE 1024*1024

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

int main (){
  int ret;

  int fd=open(TMEM_PATH,O_WRONLY);
  printf("Opened %s %d\n",TMEM_PATH,fd);
  if (fd<0){printf("ERROR! %d\n",fd);return 0;}

  char *value;
  char *key="Key";
  long flags=0;
  size_t value_len = VALUE_SIZE;
  size_t key_len = strlen(key)+1;
  size_t value_lenp;
  value = getValue();

  struct tmem_put_request tmem_put_request = {
      .key = (void*) key,
      .key_len = key_len,
      .value = (void*) value,
      .value_len = value_len,
  };

  struct tmem_request tmem_request1 = {
    .put = tmem_put_request,
    .flags = flags,
  };

  clockid_t clk_id=CLOCK_REALTIME;
  struct timespec tp1,tp2;
  long long int timePut, timeGet;

  printf("Will now make a PUT request\n");
  clock_gettime(clk_id, &tp1);
  ret = ioctl(fd, TMEM_PUT, &tmem_request1);
  clock_gettime(clk_id, &tp2);
  if (ret){printf("ERROR! %d\n",ret);return 0;}

  timePut = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;

  struct tmem_get_request tmem_get_request = {
      .key = (void*) key,
      .key_len = key_len,
      .value = (void*) value,
      .value_lenp = &value_lenp,
  };

  struct tmem_request tmem_request2 = {
.get = tmem_get_request,
.flags = flags,
  };

  printf("Will now make a GET request\n");
  clock_gettime(clk_id, &tp1);
  ret = ioctl(fd, TMEM_GET, &tmem_request2);
  clock_gettime(clk_id, &tp2);
  if (ret){printf("ERROR! %d\n",ret);return 0;}

  timePut = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;

  printf("Put %lld Get %lld", timePut,timeGet);

  close(fd);
  free(value);
  return 0;
}
