#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <string.h>

#include <time.h>
#define NSEC 1000000000
int main(){

  clockid_t clk_id=CLOCK_REALTIME;
  struct timespec tp1,tp2;
  long int nanosecs;

  clock_gettime(clk_id, &tp1);
  clock_gettime(clk_id, &tp2);

  nanosecs = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;
  printf("%ld nanoseconds\n",nanosecs);
  printf("%lu %lu\n",sizeof(long long int), sizeof(long int));
  return 0;
}
