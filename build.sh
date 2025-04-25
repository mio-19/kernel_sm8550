#!/bin/bash

set -e

KERNEL_DEFCONFIG=gki_defconfig
CLANG_BINARY="clang"
export KBUILD_COMPILER_STRING="$($CLANG_BINARY --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')"

make -j$(nproc --all) CC=clang \
                      LD=ld.lld \
                      LLVM=1 \
                      LLVM_IAS=1 \
                      $KERNEL_DEFCONFIG
 
make -j$(nproc --all) CC=clang \
                      LD=ld.lld \
                      LLVM=1 \
                      LLVM_IAS=1
