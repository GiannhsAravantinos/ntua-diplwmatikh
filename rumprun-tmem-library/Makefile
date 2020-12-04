rumpCompiler = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-gcc
rumpBaker = ~/rumprun/rumprun/rumprun/bin/rumprun-bake
TARGET = hw_generic
#set this to rumprun gcc compiler

all:hypercallDemonstrator.bin localDemo #1st to run with Rumprun, 2nd for local test



hypercallDemonstrator.bin:hypercallDemonstrator
	$(rumpBaker) $(TARGET) hypercallDemonstrator.bin hypercallDemonstrator

hypercallDemonstrator:rumprun_kvm_hypercall_tmem.o
	$(rumpCompiler) $^ -o hypercallDemonstrator hypercallDemonstrator.c

rumprun_kvm_hypercall_tmem.o: rumprun_kvm_hypercall_tmem.c
	$(rumpCompiler) -fPIC -g -c rumprun_kvm_hypercall_tmem.c -o rumprun_kvm_hypercall_tmem.o



localDemo:local_rumprun_kvm_hypercall_tmem.o
	gcc $^ -o localDemo hypercallDemonstrator.c

local_rumprun_kvm_hypercall_tmem.o: rumprun_kvm_hypercall_tmem.c
	gcc -fPIC -g -c rumprun_kvm_hypercall_tmem.c -o local_rumprun_kvm_hypercall_tmem.o



clean:
	rm -rf *.so *.o hypercallDemonstrator hypercallDemonstrator.bin localDemo
