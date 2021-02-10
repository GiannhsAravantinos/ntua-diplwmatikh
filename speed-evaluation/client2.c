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
  char print_commands[][20] = {"get","set","tmemGet","tmemPut","origTmemGet","origTmemPut"};
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

void saveResults(int fd, long long num_of_requests){
  double avg_ops;
  char buf[100];

  avg_ops =  ((double) num_of_requests)/ DURATION ;

  sprintf(buf,"Average %f ops/seconds",avg_ops);
  write(fd,buf,strlen(buf));
  sprintf(buf,"\nTotal %d seconds",DURATION);
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

  /* assign IP, PORT */
  sa.sin_family = AF_INET;
  if(command_type<=3){/*rumprun */
    sa.sin_addr.s_addr = inet_addr(HOST);
    sa.sin_port = htons(PORT);
  }
  else{/*original*/
    sa.sin_addr.s_addr = inet_addr(LOCALHOST);
    sa.sin_port = htons(LOCAL_PORT);
  }

  /* connect the client socket to server socket */
  if ((err=connect(sockfd, (struct sockaddr *) &sa, sizeof(sa))) != 0) {
      printf("ERROR:connection with the server failed...%d\n",err);
      return 0;
  }
  return sockfd;
}

void invalidateKey(int fd,char *key){
  char buff[100];

  if(command_type==1 || command_type==0){
    sprintf(buff,"FLUSHALL\n");
    insist_write(fd, buff, strlen(buff));
    read(fd,buff,100);
    return;
  }
  else if(command_type==2 || command_type==3){
    sprintf(buff,"tmemInval %s\n",key);
    insist_write(fd, buff, strlen(buff));
    read(fd,buff,100);
    return;
  }
  else{
    sprintf(buff,"tmem.inval %s\n",key);
    insist_write(fd, buff, strlen(buff));
    read(fd,buff,100);
    return;
  }
  return ;
}



long long performOneIteration(int fd, char *value, char *prefix){
  char *req=NULL;
  char reply[100];

  time_t tt;
  int size;

  long long counter=0;

  req = createReq(command_type,prefix,value,&size);
  printf("%s\n",req);

  tt=time(NULL);

  while(1){//forever writing requests
    insist_write(fd,req,strlen(req));
    read(fd,reply,100);

    invalidateKey(fd,prefix);

    counter++;
    if((time(NULL)-tt)>=DURATION){
      break;
    }
  }

  tt=time(NULL)-tt;
  printf("Time %d, reqs %lld\n",(int)tt,counter);
  return counter;
}

void setParameters(int argc, char *argv[]){
  if(argc!=3){
    printf("ERROR:wrong number of params\n");
    return;
  }
  command_type = atoi(argv[1]);
  value_size = atoi(argv[2]);
  printf("%d %d \n",command_type, value_size);

  return;
}

int main(int argc, char *argv[]){
  setParameters(argc, argv);

  int sockfd;

  sockfd = establish_connection();
  printf("Can now use fd %d\n",sockfd);

  int savefd = getSaveFileDescriptor();
  printf("Can now save results on %d\n",savefd);


  char *prefix="Key";
  char *value = createLargeValue(value_size);


  long long num_of_requests = performOneIteration(sockfd, value, prefix);

  saveResults(savefd, num_of_requests);
  return 0;
}
