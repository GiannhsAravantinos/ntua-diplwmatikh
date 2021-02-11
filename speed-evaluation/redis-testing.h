#ifndef REDIS_TESTING_H
#define REDIS_TESTING_H

/* IP-PORT of redis Unikernel*/
#define PORT 6379
#define HOST "10.0.120.101"

#define LOCALHOST "127.0.0.1"
#define LOCAL_PORT 22224
/*redis-commands*/
#define GET 0
#define SET 1
#define TMEMGET 2
#define TMEMPUT 3
#define TMEM_GET 4
#define TMEM_PUT 5
/* Original GET 6, original SET 7*/

#define COMMAND_TYPE SET
#define VALUE_SIZE 1024
#define NUM_OF_KEYS 2*1024
#define NUM_OF_ITERATIONS 10

#define DURATION 30

#endif
