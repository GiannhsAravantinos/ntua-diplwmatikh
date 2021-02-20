#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <string.h>

#define NSEC 1000000000

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

void getnumbers(char *str){
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

  printf("%ld-%ld-%ld\n",
rNum(str,startingPos[0]),
rNum(str,startingPos[1]),
rNum(str,startingPos[2]));
}


int main(int argc, char **argv)
{

  char reply[]="$69\n+OK\nredisTime 120\n\
driverTime 110\nhypercallTime 100\naaaaaaaaaaaa\r\n";

  printf("%s\n",reply);
  getnumbers(reply);

  return 0;
}
