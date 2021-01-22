#ifndef REDIS_TESTING_H
#define REDIS_TESTING_H

/* IP-PORT of redis Unikernel*/
#define PORT 6379
#define HOST "10.0.120.101"

/*redis-commands*/
#define GET 0
#define SET 1
#define TMEMGET 2
#define TMEMPUT 3


#define COMMAND_TYPE SET
#define VALUE_SIZE 1024
#define NUM_OF_KEYS 2*1024
#define NUM_OF_ITERATIONS 10

#endif
