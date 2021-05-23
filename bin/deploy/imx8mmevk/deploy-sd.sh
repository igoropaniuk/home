#!/bin/bash

set -e

MACHINE=imx8mmevk
CURR=$PWD
LMP_TOOLS=~/foundries.io/reps/lmp-8mmini-factory-igor.repo/tools/lmp-tools/security/imx_hab4/
CST=~/foundries.io/tools/cst-3.3.1/linux64/bin
DEV="$1"

export PATH=$CST:$PATH

cp -L ../../../../build-lmp/deploy/images/${MACHINE}/lmp-factory-image-${MACHINE}.wic .
cp -L ../../../../build-lmp/deploy/images/${MACHINE}/imx-boot-${MACHINE} .
cp -L ../../../../build-lmp/deploy/images/${MACHINE}/u-boot-${MACHINE}.itb .
cp -L ../../../../build-lmp/deploy/images/${MACHINE}/sit-${MACHINE}.bin .

cd $LMP_TOOLS
./sign-file.sh --spl $CURR/imx-boot-${MACHINE}
./sign-file.sh --spl $CURR/mfgtool-files/imx-boot-mfgtool
cd $CURR

cp $CURR/imx-boot-${MACHINE}.signed $CURR/imx-boot-${MACHINE}
cp $CURR/mfgtool-files/imx-boot-mfgtool.signed $CURR/mfgtool-files/imx-boot-mfgtool

sudo umount /media/xdev/*
sudo dd of=${DEV} if=lmp-factory-image-${MACHINE}.wic bs=1M iflag=fullblock oflag=direct conv=fsync
sudo dd if=sit-${MACHINE}.bin bs=512 seek=65 of=${DEV}
sudo dd if=imx-boot-${MACHINE}.signed bs=512 seek=66 of=${DEV}
sudo dd if=imx-boot-${MACHINE}.signed bs=512 seek=4162 of=${DEV}
