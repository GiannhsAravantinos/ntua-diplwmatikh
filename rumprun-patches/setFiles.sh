#!/bin/bash

RUMPRUN_REPO=/home/yiannis/rumprun/rumprun


echo "cp sys_tmem.c ${RUMPRUN_REPO}/src-netbsd/sys/kern/"
cp sys_tmem.c ${RUMPRUN_REPO}/src-netbsd/sys/kern/
