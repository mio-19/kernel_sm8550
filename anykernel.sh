#!/bin/sh
set -e

TARGET_DEFCONFIG=${1:-kalama_gki_defconfig}

# pack AnyKernel3
cd out
if [ ! -d AnyKernel3 ]; then
  git clone --depth=1 https://github.com/fei-ke/AnyKernel3.git -b kalama
fi
cp arch/arm64/boot/Image AnyKernel3/zImage
name=${TARGET_DEFCONFIG%%_defconfig}_kernel_`cat include/config/kernel.release`_`date '+%Y_%m_%d'`
cd AnyKernel3
zip -r ${name}.zip * -x *.zip
echo "AnyKernel3 package output to $(realpath $name).zip"