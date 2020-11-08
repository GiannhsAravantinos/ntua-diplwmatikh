compiler = ~/rumprun/rumprun/rumprun/bin/x86_64-rumprun-netbsd-gcc
#set this to rumprun gcc compiler


hypercallDemonstrator:rumprun_kvm_hypercall_tmem.o
	$(compiler) $^ -o hypercallDemonstrator hypercallDemonstrator.c


%.o: %.c
	$(compiler) -fPIC -g -c $^ -o $@

clean:
	rm -rf *.so *.o hypercallDemonstrator
