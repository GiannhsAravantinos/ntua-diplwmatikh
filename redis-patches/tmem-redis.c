/*This file implements the 3 new redis commands. Each command corresponds
to one of the 3 tmem kvm operations. We use the function call tmem version,
but the code can be easily changed to use system call version.*/

#include <stdlib.h>
#include <string.h>
#include <sys/time.h>


#include "redis.h"
#include "tmem_ops.h"

char reply[1024];/*assuming 1KB characters are more than enough to store reply*/
int ret;        /*for longer key/value pair this might cause errors*/
/*Throughout this file we take into account that size of string of length n is actually n+1 (null terminated) [1]*/

void tmemPutCommand(redisClient *c){
  char *key,*value;
  size_t key_len, value_len;

  /*Check that arguments are given in proper way*/
  if(c->argc != 3){
    addReplyBulkCString(c, "ERROR: format is tmemPut (key) (value)");
    return;
  }
  /*Get key-value pair, everything is assumed to be a string*/
  key_len = stringObjectLen(c->argv[1]);
  key = c->argv[1]->ptr;
  value_len = stringObjectLen(c->argv[2]);
  value = c->argv[2]->ptr;

  /*Copy values to *void, and perform tmem operation*/
  void *key_arg, *value_arg;
  size_t key_len_arg = key_len+1, value_len_arg = value_len+1;//[1]
  if((key_arg = malloc(key_len_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  if((value_arg = malloc(value_len_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  memcpy(key_arg, key, key_len_arg);
  memcpy(value_arg, value, value_len_arg);

  ret = tmem_put(key_arg, key_len_arg, value_arg, value_len_arg,NULL);

  if(ret!=-1){
    sprintf(reply, "+OK");
  }
  else{
    sprintf(reply, "+ERROR");
  }
  addReplyBulkCString(c, reply);

  free(key_arg);
  free(value_arg);
  return;
}

void tmemGetCommand(redisClient *c){
  char *key, *value;
  size_t key_len, value_len;

  /*Check that arguments are given in proper way*/
  if(c->argc != 2){
    addReplyBulkCString(c, "ERROR: format is tmemGet (key)");
    return;
  }
  /*Get key, everything is assumed to be a string*/
  key_len = stringObjectLen(c->argv[1]);
  key = c->argv[1]->ptr;

  /*Copy values to *void, and perform tmem operation*/
  void *key_arg, *value_arg;
  size_t key_len_arg = key_len+1, *value_lenp_arg, value_len1;//[1]
  value_lenp_arg = &value_len1;
  if((key_arg = malloc(key_len_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  if((value_arg = malloc(TMEM_MAX)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  memcpy(key_arg, key, key_len_arg);

  ret = tmem_get(key_arg, key_len_arg, value_arg, value_lenp_arg,NULL);

  /*Copy return value to a string*/
  value_len = *value_lenp_arg-1;//[1]
  if((value = (char*) malloc(*value_lenp_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  memcpy(value,value_arg,*value_lenp_arg);

  if(ret!=-1){
    sprintf(reply, "+%ld\n%s", strlen(value),value);
  }
  else{
    sprintf(reply, "+ERROR");
  }
  addReplyBulkCString(c, reply);

  free(key_arg);
  free(value_arg);
  free(value);
  return;
}


void tmemInvalCommand(redisClient *c){
  char *key;
  size_t key_len;

  /*Check that arguments are given in proper way*/
  if(c->argc != 2){
    addReplyBulkCString(c, "ERROR: format is tmemGet (key)");
    return;
  }
  /*Get key pair, everything is assumed to be a string*/
  key_len = stringObjectLen(c->argv[1]);
  key = c->argv[1]->ptr;

  sprintf(reply, "Inval:Key %s %ld", key, key_len);

  /*Copy values to *void, and perform tmem operation*/
  void *key_arg;
  size_t key_len_arg = key_len+1;//[1]
  if((key_arg = malloc(key_len_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  memcpy(key_arg, key, key_len_arg);

  ret = tmem_invalidate_page(key_arg, key_len_arg,NULL);
  if(ret!=-1){
    sprintf(reply, "+OK");
  }
  else{
    sprintf(reply, "+ERROR");
  }

  addReplyBulkCString(c, reply);

  free(key_arg);
  return;
}

void tmemPutTimeCommand(redisClient *c){
  clockid_t clk_id = CLOCK_REALTIME;
  struct timespec tp1, tp2;
  struct timespec tp3, tp4;
  struct myTimes times;
  times.driverTime=0;times.redisTime=0;times.hypercallTime=0;

  char *key,*value;
  size_t key_len, value_len;

  /*Check that arguments are given in proper way*/
  if(c->argc != 3){
    addReplyBulkCString(c, "ERROR: format is tmemPutTime (key) (value)");
    return;
  }
  /*Get key-value pair, everything is assumed to be a string*/
  clock_gettime(clk_id, &tp1);
  key_len = stringObjectLen(c->argv[1]);
  key = c->argv[1]->ptr;
  value_len = stringObjectLen(c->argv[2]);
  value = c->argv[2]->ptr;

  /*Copy values to *void, and perform tmem operation*/
  void *key_arg, *value_arg;
  size_t key_len_arg = key_len+1, value_len_arg = value_len+1;//[1]
  if((key_arg = malloc(key_len_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  if((value_arg = malloc(value_len_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  memcpy(key_arg, key, key_len_arg);
  memcpy(value_arg, value, value_len_arg);

  clock_gettime(clk_id, &tp3);
  ret = tmem_put(key_arg, key_len_arg, value_arg, value_len_arg, &times);
  clock_gettime(clk_id, &tp4);

  clock_gettime(clk_id, &tp2);
  times.redisTime = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;
  times.driverTime = (tp4.tv_sec - tp3.tv_sec)*NSEC + tp4.tv_nsec-tp3.tv_nsec;

  if(ret!=-1){
    sprintf(reply, "+OK\nredisTime %ld\ndriverTime %ld\nhypercallTime %ld",
    times.redisTime, times.driverTime, times.hypercallTime);
  }
  else{
    sprintf(reply, "+ERROR");
  }
  addReplyBulkCString(c, reply);

  free(key_arg);
  free(value_arg);
  return;
}

void tmemGetTimeCommand(redisClient *c){
  char *key, *value;
  size_t key_len, value_len;

  /*Check that arguments are given in proper way*/
  if(c->argc != 2){
    addReplyBulkCString(c, "ERROR: format is tmemGet (key)");
    return;
  }
  /*Get key, everything is assumed to be a string*/
  key_len = stringObjectLen(c->argv[1]);
  key = c->argv[1]->ptr;

  /*Copy values to *void, and perform tmem operation*/
  void *key_arg, *value_arg;
  size_t key_len_arg = key_len+1, *value_lenp_arg, value_len1;//[1]
  value_lenp_arg = &value_len1;
  if((key_arg = malloc(key_len_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  if((value_arg = malloc(TMEM_MAX)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  memcpy(key_arg, key, key_len_arg);

  ret = tmem_get(key_arg, key_len_arg, value_arg, value_lenp_arg,NULL);

  /*Copy return value to a string*/
  value_len = *value_lenp_arg-1;//[1]
  if((value = (char*) malloc(*value_lenp_arg)) == NULL){
    addReplyBulkCString(c, "No memory"); return;
  }
  memcpy(value,value_arg,*value_lenp_arg);

  if(ret!=-1){
    //sprintf(reply, "+%ld\n%s", strlen(value),value);
    sprintf(reply, "OK");
  }
  else{
    sprintf(reply, "+ERROR");
  }

  addReplyBulkCString(c, reply);

  free(key_arg);
  free(value_arg);
  free(value);
  return;
}
