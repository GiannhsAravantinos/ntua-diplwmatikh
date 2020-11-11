compiler = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-gcc
baker = ~/rumprun/rumprun/rumprun/bin/rumprun-bake
#set this to rumprun gcc compiler

hypercallDemonstrator.bin:hypercallDemonstrator
	$(baker) hw_generic hypercallDemonstrator.bin hypercallDemonstrator

hypercallDemonstrator:rumprun_kvm_hypercall_tmem.o
	$(compiler) $^ -o hypercallDemonstrator hypercallDemonstrator.c

%.o: %.c
	$(compiler) -fPIC -g -c $^ -o $@


clean:
	rm -rf *.so *.o hypercallDemonstrator hypercallDemonstrator.bin
