rumpCompiler = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-gcc
rumpBaker = ~/rumprun/rumprun/rumprun/bin/rumprun-bake
TARGET = hw_generic
#set this to rumprun gcc compiler

all:hypercallDemonstrator.bin #1st to run with Rumprun



hypercallDemonstrator.bin:hypercallDemonstrator
	echo "BAKE hypercallDemonstrator.bin"
	$(rumpBaker) $(TARGET) hypercallDemonstrator.bin hypercallDemonstrator

hypercallDemonstrator:rumprun_kvm_hypercall_tmem.o
	echo "GCC - o hypercallDemonstrator"
	$(rumpCompiler) $^ -o hypercallDemonstrator hypercallDemonstrator.c

rumprun_kvm_hypercall_tmem.o: rumprun_kvm_hypercall_tmem.c
	echo "GCC hypercallDemonstrator.o"
	$(rumpCompiler) -fPIC -g -c rumprun_kvm_hypercall_tmem.c -o rumprun_kvm_hypercall_tmem.o

clean:
	rm -rf *.so *.o hypercallDemonstrator hypercallDemonstrator.bin localDemo
