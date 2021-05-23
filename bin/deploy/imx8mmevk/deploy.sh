#!/bin/bash

set -e

CURR=$PWD
LMP_TOOLS=~/foundries.io/reps/lmp-8mmini-factory-igor.repo/tools/lmp-tools/security/imx_hab4/
CST=~/foundries.io/tools/cst-3.3.1/linux64/bin

export PATH=$CST:$PATH

cp -L ../../../../build-lmp/deploy/images/imx8mmevk/imx-boot-imx8mmevk .
cp -L ../../../../build-lmp/deploy/images/imx8mmevk/u-boot-imx8mmevk.itb .
#cp -L ../../../../build-lmp/deploy/images/imx8mmevk/lmp-base-console-image-imx8mmevk.wic .
cp -L ../../../../build-lmp/deploy/images/imx8mmevk/lmp-factory-image-imx8mmevk.wic .
#cp -L ../../../../build-lmp/deploy/images/imx8mmevk/sit-imx8mmevk.bin .

cd $LMP_TOOLS
./sign-file.sh --spl $CURR/imx-boot-imx8mmevk
./sign-file.sh --spl $CURR/mfgtool-files/imx-boot-mfgtool
cd $CURR

cp mfgtool-files/imx-boot-mfgtool.signed mfgtool-files/imx-boot-mfgtool
cp imx-boot-imx8mmevk.signed imx-boot-imx8mmevk

echo "Invoking uuu..."
#sudo mfgtool-files/uuu -pp 1 mfgtool-files/full_image.uuu
sudo mfgtool-files/uuu -pp 1 mfgtool-files/full_image_factory.uuu
#sudo mfgtool-files/uuu -pp 1 mfgtool-files/bootloader.uuu
