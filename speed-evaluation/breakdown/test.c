#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

/*In order to breakdown stages */
#include <time.h>
#define NSEC 1000000000
struct myTimes{
  long int redisTime;
  long int driverTime;
  long int hypercallTime;
};/*everything is in nanoseconds*/


int main(){
  clockid_t clk_id=CLOCK_REALTIME;
  struct timespec tp1,tp2;
  long int nanosecs;

  while(1){
    clock_gettime(clk_id, &t12);
    clock_gettime(clk_id, &tp2);

    nanosecs = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;
    if(nanosecs<0){
      printf("Error negative value\n");
      printf("%ld\n",nanosecs);
      printf("TP1 %ld %ld\n",tp1.tv_sec,tp1.tv_nsec);
      printf("TP2 %ld %ld\n",tp2.tv_sec,tp2.tv_nsec);
      break;
    }
  }
  return 0;
}
