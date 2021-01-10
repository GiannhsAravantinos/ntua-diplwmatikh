.PHONY: all clean

FLAGS=-Wall -Wno-discarded-qualifiers -Wno-unused-but-set-variable -Wno-unused-variable
rumpCompiler = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-gcc
rumpLinker = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-ld

all: tmem-rumprun-redis.so

tmem-rumprun-redis.so: loader.o
	$(rumpLinker) -fPIC -g -shared -o tmem-rumprun-redis.so $^

%.o: %.c
	$(rumpCompiler) $(FLAGS) -fPIC -g -c $^ -o $@

clean:
	rm -rf *.so *.o
