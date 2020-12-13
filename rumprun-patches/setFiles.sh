#!/bin/bash

RUMPRUN_REPO=/home/yiannis/rumprun/rumprun


echo "cp syscalls.master ${RUMPRUN_REPO}/src-netbsd/sys/kern/"
cp syscalls.master ${RUMPRUN_REPO}/src-netbsd/sys/kern/
echo ""

echo "./makesyscalls.sh syscalls.conf syscalls.master"
DIR=${PWD}
cd ${RUMPRUN_REPO}/src-netbsd/sys/kern/
chmod +x makesyscalls.sh
./makesyscalls.sh syscalls.conf syscalls.master
cd ${DIR}
echo ""


echo "cp sys_tmem.c ${RUMPRUN_REPO}/src-netbsd/sys/kern/"
cp sys_tmem.c ${RUMPRUN_REPO}/src-netbsd/sys/kern/
echo ""

echo "cp tmem_kernel.h ${RUMPRUN_REPO}/src-netbsd/sys/kern/"
cp tmem_kernel.h ${RUMPRUN_REPO}/src-netbsd/sys/kern/
echo ""

echo "cp Makefile.rumpkern ${RUMPRUN_REPO}/src-netbsd/sys/rump/librump/rumpkern/"
cp Makefile.rumpkern ${RUMPRUN_REPO}/src-netbsd/sys/rump/librump/rumpkern/
echo ""

echo "cp rumpkern_syscalls.c ${RUMPRUN_REPO}/src-netbsd/sys/rump/librump/rumpkern"
cp rumpkern_syscalls.c ${RUMPRUN_REPO}/src-netbsd/sys/rump/librump/rumpkern/
