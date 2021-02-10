CC = gcc

all: client client2

client: client.o
	$(CC) -g -Wall -o $@ $^

client.o: client.c
	$(CC) -g -Wall -c -o $@ $<

client2: client2.o
	$(CC) -g -Wall -o $@ $^

client2.o: client2.c
	$(CC) -g -Wall -c -o $@ $<


clean:
	rm -rf *.o
	rm client client2
