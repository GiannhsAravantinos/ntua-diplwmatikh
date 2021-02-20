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
#include <time.h>
#define NSEC 1000000000

#include "redis-testing.h"

struct myTimes{
  long int networkTime;
  long int redisTime;
  long int driverTime;
  long int hypercallTime;
};

char commands[][20] = {"get","set","tmemGet","tmemPut","tmem.get","tmem.put","get","set",
"tmemGetTime","tmemPutTime"};
int command_type = COMMAND_TYPE;
int value_size = VALUE_SIZE;
int num_of_tests = 1;
/*defaults*/

int min(int a,int b){
  if(a>b){
    return b;
  }
  else{
    return a;
  }
}

long int rNum(char *str,int pos){
  long int num;
  char number[20];
  int i=0;
  while(str[pos]!=' ' && str[pos]!='\n'){
    number[i]=str[pos];
    i++;
    pos++;
  }
  number[i]='\0';

  char *ptr;
  num = strtol(number,&ptr,10);
  return num;
}

void getnumbers(char *str,struct myTimes times){
  int i,counter=0;
  int startingPos[3];


  for(i=0;i<strlen(str);i++){
    if(str[i]==' ' || str[i]=='\n'){
      counter++;
      if(counter==3){
        startingPos[0]=i+1;
      }
      if(counter==5){
        startingPos[1]=i+1;
      }
      if(counter==7){
        startingPos[2]=i+1;
        break;
      }
    }
  }

  times.redisTime=rNum(str,startingPos[0]);
  times.driverTime=rNum(str,startingPos[1]);
  times.hypercallTime=rNum(str,startingPos[2]);
}

char *createLargeValue(int size){
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

  if(req_type<0 || req_type >9){
    printf("ERROR: unknown reqType\n");
    *req_size=-1;return NULL;
  }
  command = commands[req_type];
  command_len = strlen(command);

  key_len = strlen(key);
  value_len = strlen(value);

  if(command_type==9){
    request_size = command_len + key_len + value_len + 3 +1;
  }
  else{// 8
    request_size = command_len + key_len + +1;
  }
  if((request = (char *) malloc(request_size))==NULL){
    printf("ERROR: memory not enough\n");
    *req_size=-1;return NULL;
  }

  if(command_type==9){
    sprintf(request,"%s %s %s\n",command,key,value);
  }
  else{
    sprintf(request,"%s %s\n",command,key);
  }

  *req_size=request_size;
  return request;
}

ssize_t insist_write(int fd, const void *buf, size_t cnt){
  int chunk = 1024*1024,step;
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
  char print_commands[][20] = {"get","set","tmemGet","tmemPut","origTmemGet","origTmemPut",
                              "originalGet","originalSet","tmemGetTime","tmemPutTime"};
  int fd;
  char filename[100];

  sprintf(filename,"Result_%s_%d.txt",print_commands[command_type],value_size);
  printf("%s\n",filename);
  remove(filename);
  fd = open(filename,O_CREAT | O_RDWR,S_IRWXU);
  if(fd==-1){
    printf("ERROR:opening file\n");return -1;
  }
  lseek(fd,0,SEEK_SET);

  return fd;
}

void saveResults(int fd, struct myTimes times){
  /*todo be fixed*/
  char buf[100];


  sprintf(buf,"Network %ld",times.networkTime);
  write(fd,buf,strlen(buf));
  return;

}

int establish_connection(){
  int sockfd;
  int err;
  struct sockaddr_in sa;

  /*socket creation*/
  if((sockfd=socket(AF_INET, SOCK_STREAM,0))<0){
    printf("ERROR:socket\n");
    return 0;
  }
  printf("Created TCP socket %d\n",sockfd);

  if(command_type >3 && command_type <8){
    printf("Error works only on rumprun commands");
  }
  /* assign IP, PORT */
  sa.sin_family = AF_INET;
  sa.sin_addr.s_addr = inet_addr(HOST);
  sa.sin_port = htons(PORT);


  /* connect the client socket to server socket */
  if ((err=connect(sockfd, (struct sockaddr *) &sa, sizeof(sa))) != 0) {
      printf("ERROR:connection with the server failed...%d\n",err);
      return 0;
  }
  return sockfd;
}

void invalidateKey(int fd,char *key){
  char buff[100];
  if(command_type >3 && command_type <8){
    printf("Error works only on rumprun commands");
  }

  sprintf(buff,"tmemInval %s\n",key);
  insist_write(fd, buff, strlen(buff));
  read(fd,buff,100);
  return;
}

void setKey(int fd,char *prefix,char *value){
  char *buff;
  buff = malloc(strlen(prefix) + strlen(value)+100);/*git enough for anything*/

  sprintf(buff,"tmemPut %s %s\n",prefix,value);
  insist_write(fd, buff, strlen(buff));
  read(fd,buff,100);
  return;
}

struct myTimes performOneIteration(int fd, char *value, char *prefix, char *req){
  char reply[100];

  struct myTimes times;
  times.networkTime=0;
  times.redisTime=0;
  times.driverTime=0;
  times.hypercallTime=0;

  clockid_t clk_id=CLOCK_REALTIME;
  struct timespec tp1,tp2;
  if(command_type == 8){//is GET we must first set the key
    setKey(fd,prefix,value);
  }


  clock_gettime(clk_id, &tp1);
  insist_write(fd,req,strlen(req));
  read(fd,reply,100);
  clock_gettime(clk_id, &tp2);

  printf("Reply:\n%s\nend of reply\n",reply);
  getnumbers(reply,times);

  times.networkTime = (tp2.tv_sec - tp1.tv_sec)*NSEC + tp2.tv_nsec-tp1.tv_nsec;

  invalidateKey(fd,prefix);

  printf("networkTime %ld\n",times.networkTime);
  printf("redisTime %ld\n",times.redisTime);
  printf("driverTime %ld\n",times.driverTime);
  printf("hypercallTime %ld\n",times.hypercallTime);

  return times;
}

void setParameters(int argc, char *argv[]){
  if(argc!=4){
    printf("ERROR:wrong number of params\n");
    return;
  }
  command_type = atoi(argv[1]);
  value_size = atoi(argv[2]);
  num_of_tests = atoi(argv[3]);
  printf("%d %d %d\n",command_type, value_size, num_of_tests);

  return;
}

int main(int argc, char *argv[]){
  // #./client3 [command_type] [value_size] [num_of_tests]
  setParameters(argc, argv);

  int sockfd;

  sockfd = establish_connection();
  printf("Can now use fd %d\n",sockfd);

  int savefd = getSaveFileDescriptor();
  printf("Can now save results on %d\n",savefd);

  int i,size;

  struct myTimes times[num_of_tests];

  char *prefix="Key";
  char *value = createLargeValue(value_size);

  char *req = createReq(command_type,prefix,value,&size);
  printf("%s\n",req);

  for(i=0;i<num_of_tests;i++){
    printf("New iteration %d\n",i);
    times[i] = performOneIteration(sockfd, value, prefix,req);
    printf("NetworkTime %ld\n", times[i].networkTime);
  }

  saveResults(savefd, times[0]);
  return 0;
}
