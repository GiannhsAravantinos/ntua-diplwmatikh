CC = gcc
rumpCompiler = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-gcc
rumpBaker = ~/rumprun/rumprun/rumprun/bin/rumprun-bake
TARGET = hw_generic
#set this to rumprun gcc compiler, baker and target platform

all: client server server.bin

client: client.o
	$(CC) -g -Wall -o $@ $^

client.o: client.c
	$(CC) -g -Wall -c -o $@ $<


server: server.o
	$(CC) -g -Wall -o $@ $^

server.o: server.c
	$(CC) -g -Wall -c -o $@ $<

server.bin: serverR
	$(rumpBaker) $(TARGET) server.bin serverR

serverR:
	$(rumpCompiler) $^ -o serverR -g -Wall server.c


clean:
	rm -rf *.o
	rm client server serverR server.bin
