#!/bin/bash

set -e

CURR=$PWD
LMP_TOOLS=~/foundries.io/reps/lmp-8mmini-factory-igor.repo/tools/lmp-tools/security/imx_hab4/
CST=~/foundries.io/tools/cst-3.3.1/linux64/bin
METASUB=/home/xdev/foundries.io/reps/lmp-8mmini-factory-igor.repo/layers/meta-subscriber-overrides/recipes-bsp/bootfirmware-updates/bootfirmware-updates

export PATH=$CST:$PATH

cp -L ../../../../build-lmp/deploy/images/imx8mmevk/imx-boot-imx8mmevk .
cp -L ../../../../build-lmp/deploy/images/imx8mmevk/u-boot-imx8mmevk.itb .

cd $LMP_TOOLS
./sign-file.sh --spl $CURR/imx-boot-imx8mmevk
cd $CURR

cp imx-boot-imx8mmevk.signed $METASUB/imx-boot
cp u-boot-imx8mmevk.itb $METASUB/u-boot.itb
