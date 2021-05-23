#!/bin/bash

set -e

CURR=$PWD
LMP_TOOLS=~/foundries.io/reps/lmp-8mmini-factory-igor.repo/tools/lmp-tools/security/imx_hab4/
CST=~/foundries.io/tools/cst-3.3.1/linux64/bin
DEV=$1

export PATH=$CST:$PATH

cp -L ../../../../build-lmp/deploy/images/imx8mmevk/imx-boot-imx8mmevk .
cp -L ../../../../build-lmp/deploy/images/imx8mmevk/u-boot-imx8mmevk.itb .
cp -L ../../../../build-lmp/deploy/images/imx8mmevk/sit-imx8mmevk.bin .

cd $LMP_TOOLS
./sign-file.sh --spl $CURR/imx-boot-imx8mmevk
./sign-file.sh --spl $CURR/mfgtool-files/imx-boot-mfgtool
cd $CURR

cp $CURR/imx-boot-imx8mmevk.signed $CURR/imx-boot-imx8mmevk
cp $CURR/mfgtool-files/imx-boot-mfgtool.signed $CURR/mfgtool-files/imx-boot-mfgtool

sudo umount /media/xdev/*
sudo dd if=imx-boot-imx8mmevk.signed bs=512 seek=66 of=${DEV}
sudo dd if=imx-boot-imx8mmevk.signed bs=512 seek=4162 of=${DEV}
sudo dd if=u-boot-imx8mmevk.itb bs=512 seek=768 of=${DEV}
sudo dd if=u-boot-imx8mmevk.itb bs=512 seek=4864 of=${DEV}
