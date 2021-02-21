RUMPRUN_TMEM_DIR=/home/yiannis/ntua-diplwmatikh/rumprun-tmem-func

#rumprun tmem files
echo "cp tmem.h ${PWD}/build/src"
cp ${RUMPRUN_TMEM_DIR}/tmem.h ${PWD}
echo ""

echo "cp tmem_ops.h ${PWD}/build/src"
cp ${RUMPRUN_TMEM_DIR}/tmem_ops.h ${PWD}
echo ""

echo "cp tmem_ops.c ${PWD}/build/src"
cp ${RUMPRUN_TMEM_DIR}/tmem_ops.c ${PWD}
echo ""

echo "cp tmem_kvm_hypercall.h ${PWD}/build/src"
cp ${RUMPRUN_TMEM_DIR}/tmem_kvm_hypercall.h ${PWD}
echo ""
