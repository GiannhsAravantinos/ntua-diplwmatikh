rumpCompiler = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-gcc
rumpBaker = ~/rumprun/rumprun/rumprun/bin/rumprun-bake
TARGET = hw_generic
#set this to rumprun gcc compiler, baker and target platform

all:hypercallDemonstrator.bin



hypercallDemonstrator.bin:hypercallDemonstrator
	echo "BAKE hypercallDemonstrator.bin"
	$(rumpBaker) $(TARGET) hypercallDemonstrator.bin hypercallDemonstrator

hypercallDemonstrator:tmem_ops.o
	echo "GCC - o hypercallDemonstrator"
	$(rumpCompiler) $^ -o hypercallDemonstrator hypercallDemonstrator.c

tmem_ops.o: tmem_ops.c
	echo "GCC hypercallDemonstrator.o"
	$(rumpCompiler) -fPIC -g -c tmem_ops.c -o tmem_ops.o

clean:
	rm -rf *.so *.o hypercallDemonstrator hypercallDemonstrator.bin localDemo
