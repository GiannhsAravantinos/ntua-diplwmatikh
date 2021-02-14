#include <unistd.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define MAX 1024*1024
#define SA struct sockaddr

int port;
char *host;

int min(int a,int b){
  if(a>b){
    return b;
  }
  else{
    return a;
  }
}

ssize_t insist_write(int fd, const void *buf, size_t cnt)
{
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

void func(int sockfd)
{
    char *buff;
    int bytes;

    buff = malloc(MAX);

    sprintf(buff,"Goodmoornig client here\n");
    printf("%ld %s",strlen(buff),buff);
    bytes = insist_write(sockfd,buff,strlen(buff));

    printf("Bytes %d\n",bytes);
    free(buff);
    return;
}

int establishConnection(){
  int sockfd;
  struct sockaddr_in servaddr;

  // socket create and varification
  sockfd = socket(AF_INET, SOCK_STREAM, 0);
  if (sockfd == -1) {
      printf("socket creation failed...\n");
      exit(0);
  }
  else
      printf("Socket successfully created..\n");
  bzero(&servaddr, sizeof(servaddr));

  // assign IP, PORT
  servaddr.sin_family = AF_INET;
  servaddr.sin_addr.s_addr = inet_addr(host);
  servaddr.sin_port = htons(port);

  // connect the client socket to server socket
  if (connect(sockfd, (SA*)&servaddr, sizeof(servaddr)) != 0) {
      printf("connection with the server failed...\n");
      exit(0);
  }
  else{
      printf("connected to the server..\n");
    }
  return sockfd;
}

int main(int argc, char *argv[])
{
//usage /#./client [host][port]

    host = argv[1];
    port = atoi(argv[2]);
    printf("Host %s port %d\n",host,port);

    int sockfd = establishConnection();


    func(sockfd);


    close(sockfd);
    return 0;
}
