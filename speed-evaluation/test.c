#include <stdio.h>
#include <time.h>
#include <unistd.h>

#define NSEC 1000000000
int main(int argc, char **argv)
{

  int result;
  struct timespec tp1,tp2;
  clockid_t clk_id;

  clk_id = CLOCK_REALTIME;
  //clk_id = CLOCK_MONOTONIC;
//  clk_id = CLOCK_BOOTTIME;
//  clk_id = CLOCK_PROCESS_CPUTIME_ID;

  // int clock_gettime(clockid_t clk_id, struct timespec *tp);
  result = clock_gettime(clk_id, &tp1);
  printf("result: %i\n", result);
  printf("tp.tv_sec: %ld\n", tp1.tv_sec);
  printf("tp.tv_nsec: %ld\n", tp1.tv_nsec);

  
  result = clock_gettime(clk_id, &tp2);
  printf("result: %i\n", result);
  printf("tp.tv_sec: %ld\n", tp2.tv_sec);
  printf("tp.tv_nsec: %ld\n", tp2.tv_nsec);

  long long int elapseTime = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;
  printf("elaped time %lld\n",elapseTime);
  return 0;
}
