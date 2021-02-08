#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <netdb.h>
#include <math.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <time.h>

#include "redis-testing.h"

char commands[][8] = {"get","set","tmemGet","tmemPut","tmem.get","tmem.put"};
int command_type = COMMAND_TYPE;
int value_size = VALUE_SIZE;
int num_of_keys= NUM_OF_KEYS;
/*defaults*/

int min(int a,int b){
  if(a>b){
    return b;
  }
  else{
    return a;
  }
}

char *createSeqKeys(char* prefix,int count){
  char s_count[10];
  char *buf;

  sprintf(s_count,"%d",count);
  if((buf=malloc(strlen(prefix)+strlen(s_count)+1))==NULL){
    printf("ERROR: memory\n");
    return NULL;
  }
  memcpy(buf,prefix,strlen(prefix));
  memcpy(buf+strlen(prefix),s_count,strlen(s_count));
  buf[strlen(buf)]='\0';

  count++;
  return buf;
}

char *createLargeValue(int size){
  /*
  char s_digits[100];
  int digits=size-1;
  sprintf(s_digits,"%d",digits);
  int len = (int) strlen(s_digits);
  printf("Digits %s %d\n",s_digits,len);

  if(size <1){
    printf("ERROR: not positive length\n");
    return NULL;
  }

  char *buf;
  int size1 = 2+len+4+digits+6;
  if((buf=malloc(size1))==NULL){
    printf("ERROR: memory not enough\n");
    return NULL;
  }

  memset(buf+2+len+4, (int) 'a',digits);

  buf[size1-1]='\0';
  buf[size1-2]='\"';
  buf[size1-3]='n';buf[size1-4]='\\';
  buf[size1-5]='r';buf[size1-6]='\\';

  buf[0]='\"';
  buf[1]='$';

  memcpy(buf+2,s_digits,len);

  buf[2+len]='\\';buf[2+len+1]='r';
  buf[2+len+2]='\\';buf[2+len+3]='n';

  //printf("%s\n",buf);
  return buf;*/
  if(size <1){
    printf("ERROR: not positive length\n");
    return NULL;
  }

  char *buf;
  if((buf=malloc(size))==NULL){
    printf("ERROR: memory not enough\n");
    return NULL;
  }
  memset(buf, (int) 'a',size-1);
  buf[size]='\0';
  return buf;
}

char *createReq(int req_type, char *key, char* value, int *req_size){
  char *command, *request;
  size_t command_len, key_len, value_len, request_size;

  if(req_type<0 || req_type >5){
    printf("ERROR: unknown reqType\n");
    *req_size=-1;return NULL;
  }
  command = commands[req_type];
  command_len = strlen(command);

  key_len = strlen(key);
  value_len = strlen(value);

  request_size = command_len + key_len + value_len + 3 +1;
  if((request = (char *) malloc(request_size))==NULL){
    printf("ERROR: memory not enough\n");
    *req_size=-1;return NULL;
  }

  memcpy(request, command, command_len);
  memcpy(request+command_len+1, key, key_len);
  memcpy(request+command_len+key_len+2, value, value_len);

  request[command_len]= ' ';
  request[command_len+key_len+1]= ' ';
  request[command_len+key_len+value_len+2]='\n';
  request[command_len+key_len+value_len+3]='\0';


  *req_size=request_size;
  return request;
}

ssize_t insist_write(int fd, const void *buf, size_t cnt)
{
  int chunk = 1024*16,step;
  ssize_t ret;
  size_t orig_cnt = cnt;
  //printf("Original count %d\n",(int) cnt);
  step=min(chunk,cnt);
  //printf("step %d\n",step);

  while (cnt > 0) {
    //printf("Inside while %d %ld \n",step,cnt);
    ret = write(fd, buf, step);
    if (ret < 0){
      printf("ERROR on write\n");
      return ret;
    }
    buf += ret;
    cnt -= ret;
    step=min(chunk,cnt);
    //usleep(1000*500);
  }
  //printf("After while\n");
  return orig_cnt;
}

int getSaveFileDescriptor(){
  char print_commands[][8] = {"get","set","tmemGet","tmemPut","TmemGet","TmemPut"};
  int fd;
  char filename[100];

  sprintf(filename,"Result_%s_%d_%d.txt",print_commands[command_type],value_size,num_of_keys);
  printf("%s\n",filename);
  remove(filename);
  fd = open(filename,O_CREAT | O_RDWR,S_IRWXU);
  if(fd==-1){
    printf("ERROR:opening file\n");return -1;
  }
  lseek(fd,0,SEEK_SET);

  return fd;
}

void saveResults(int fd, time_t *times){
  double avg_ops,avg_time;
  int i,sum=0;
  char buf[100];

  for(i=0;i<NUM_OF_ITERATIONS;i++){
    sum+= times[i];
  }

  if(sum==0){
    sprintf(buf,"Error, too fast\n");
    write(fd,buf,strlen(buf));
    return;
  }

  avg_time = (double) sum / NUM_OF_ITERATIONS;
  avg_ops =  num_of_keys/ avg_time ;

  sprintf(buf,"Average %f ops/seconds",avg_ops);
  write(fd,buf,strlen(buf));
  sprintf(buf,"\nAverage %f seconds",avg_time);
  write(fd,buf,strlen(buf));
  sprintf(buf,"\nTotal %d seconds",sum);
  write(fd,buf,strlen(buf));
  return;

}

int establish_connection(){
  int sockfd;
  struct sockaddr_in sa;

  /*socket creation*/
  if((sockfd=socket(AF_INET, SOCK_STREAM,0))<0){
    printf("ERROR:socket\n");
    return 0;
  }
  printf("Created TCP socket %d\n",sockfd);

  /* assign IP, PORT */
  sa.sin_family = AF_INET;
  sa.sin_port = htons(PORT);
  if(command_type<=3){
    sa.sin_addr.s_addr = inet_addr(HOST);
  }
  else{
    sa.sin_addr.s_addr = inet_addr(LOCALHOST);
  }

  /* connect the client socket to server socket */
  if (connect(sockfd, (struct sockaddr *) &sa, sizeof(sa)) != 0) {
      printf("ERROR:connection with the server failed...\n");
      return 0;
  }
  return sockfd;
}

void emptyRedis(int fd,char *prefix){
  char buf[100];
  char *key;
  int i;

  if(command_type==0 || command_type==1){//vanilla commands
    sprintf(buf,"FLUSHALL\n");
    insist_write(fd, buf, strlen(buf));
    read(fd,buf,100);
    return;
  }
  else if (command_type==2 || command_type==3){//tmemCommands, we must iterate over all keys
    for(i=0;i<NUM_OF_KEYS;i++){
      key = createSeqKeys(prefix,i);
      sprintf(buf,"tmemInval %s\n",key);
      insist_write(fd, buf, strlen(buf));
      read(fd,buf,100);
      free(key);
    }
  }
  else{//original utmem
    for(i=0;i<NUM_OF_KEYS;i++){
      key = createSeqKeys(prefix,i);
      sprintf(buf,"tmem.inval %s\n",key);
      insist_write(fd, buf, strlen(buf));
      read(fd,buf,100);
      free(key);
    }
  }
}

time_t performOneIteration(int fd, char *value, char *prefix){
  char *key;
  char *req=NULL;
  char reply[100];

  time_t tt;
  int i,size;

  tt=time(NULL);
  for(i=0;i<num_of_keys;i++){
    key = createSeqKeys(prefix,i);

    req = createReq(command_type, key, value, &size);

    insist_write(fd, req, strlen(req));
    read(fd,reply,100);
    free(req);
    free(key);
  }

  tt=time(NULL)-tt;

  emptyRedis(fd, prefix);
  return tt;
}

void setParameters(int argc, char *argv[]){
  if(argc!=4){
    printf("ERROR:wrong number of params\n");
    return;
  }
  command_type = atoi(argv[1]);
  value_size = atoi(argv[2]);
  num_of_keys = atoi(argv[3]);
  printf("%d %d %d\n",command_type, value_size, num_of_keys);

  return;
}

int main(int argc, char *argv[]){
  setParameters(argc, argv);

  int sockfd;

  sockfd = establish_connection();
  printf("Can now use fd %d\n",sockfd);

  int savefd = getSaveFileDescriptor();
  printf("Can now save results on %d\n",savefd);

  int i;

  time_t times[NUM_OF_ITERATIONS];

  char *prefix="Key";
  char *value = createLargeValue(value_size);
  printf("%s\n",value);

  for(i=0;i<NUM_OF_ITERATIONS;i++){
    printf("New iteration %d\n",i);
    times[i] = performOneIteration(sockfd, value, prefix);
    printf("Time %d\n",(int)times[i]);
  }

  saveResults(savefd, times);
  return 0;
}
