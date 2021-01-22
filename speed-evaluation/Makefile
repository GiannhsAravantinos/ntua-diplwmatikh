CC = gcc

all: client

client: client.o
	$(CC) -g -Wall -o $@ $^

client.o: client.c
	$(CC) -g -Wall -c -o $@ $<


clean:
	rm -rf *.o
	rm client
