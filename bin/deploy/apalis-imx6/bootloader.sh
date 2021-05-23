#!/bin/bash

set -e

MACHINE=apalis-imx6
CURR=$PWD
LMP_TOOLS=~/foundries.io/reps/lmp-8mmini-factory-igor.repo/tools/lmp-tools/security/imx_hab4/
CST=~/foundries.io/tools/cst-3.3.1/linux64/bin
DEV="$1"

export PATH=$CST:$PATH

#cp -L ../../../../build-lmp/deploy/images/${MACHINE}/lmp-factory-image-${MACHINE}.wic .
cp -L ../../../../build-lmp/deploy/images/${MACHINE}/SPL-${MACHINE} .
cp -L ../../../../build-lmp/deploy/images/${MACHINE}/u-boot-${MACHINE}.itb .
cp -L ../../../../build-lmp/deploy/images/${MACHINE}/sit-${MACHINE}.bin .

echo "Invoking uuu..."
sudo mfgtool-files/uuu -pp 1 mfgtool-files/bootloader.uuu
