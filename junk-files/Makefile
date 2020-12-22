.PHONY: all clean

FLAGS=-Wall -Wno-discarded-qualifiers -Wno-unused-but-set-variable -Wno-unused-variable
rumpCompiler = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-gcc

all: lib.so

lib.so: prog.o
	$(rumpCompiler) $^ -fPIC -shared -g -o lib.so

%.o: %.c
	$(rumpCompiler) $(FLAGS) -fPIC -g -c $^ -o $@

clean:
	rm -rf *.so *.o
