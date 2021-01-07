#!/bin/bash

RUMPRUN_REDIS_REPO=/home/yiannis/rumprun/rumprun-packages/redis
RUMPRUN_TMEM_DIR=/home/yiannis/ntua-diplwmatikh/rumprun-tmem-func

#rumprun Makefile
echo "cp Makefile ${RUMPRUN_REDIS_REPO}"
cp Makefile ${RUMPRUN_REDIS_REPO}
echo ""


#redis src files
echo "cp redis.h ${RUMPRUN_REDIS_REPO}/build/src"
cp redis.h ${RUMPRUN_REDIS_REPO}/build/src
echo ""

echo "cp redis.c ${RUMPRUN_REDIS_REPO}/build/src"
cp redis.c ${RUMPRUN_REDIS_REPO}/build/src
echo ""

echo "cp tmem-redis.c ${RUMPRUN_REDIS_REPO}/build/src"
cp tmem-redis.c ${RUMPRUN_REDIS_REPO}/build/src
echo ""


#rumprun tmem files
echo "cp tmem.h ${RUMPRUN_REDIS_REPO}/build/src"
cp ${RUMPRUN_TMEM_DIR}/tmem.h ${RUMPRUN_REDIS_REPO}/build/src
echo ""

echo "cp tmem_ops.h ${RUMPRUN_REDIS_REPO}/build/src"
cp ${RUMPRUN_TMEM_DIR}/tmem_ops.h ${RUMPRUN_REDIS_REPO}/build/src
echo ""

echo "cp tmem_ops.c ${RUMPRUN_REDIS_REPO}/build/src"
cp ${RUMPRUN_TMEM_DIR}/tmem_ops.c ${RUMPRUN_REDIS_REPO}/build/src
echo ""

echo "cp tmem_kvm_hypercall.h ${RUMPRUN_REDIS_REPO}/build/src"
cp ${RUMPRUN_TMEM_DIR}/tmem_kvm_hypercall.h ${RUMPRUN_REDIS_REPO}/build/src
echo ""


#redis src Makefile
echo "cp build-src-Makefile ${RUMPRUN_REDIS_REPO}/build/src"
cp build-src-Makefile ${RUMPRUN_REDIS_REPO}/build/src/Makefile
echo ""
