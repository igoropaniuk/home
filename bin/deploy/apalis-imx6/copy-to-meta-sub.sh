#!/bin/bash

set -e

CURR=$PWD
LMP_TOOLS=~/foundries.io/reps/lmp-8mmini-factory-igor.repo/tools/lmp-tools/security/imx_hab4/
CST=~/foundries.io/tools/cst-3.3.1/linux64/bin
METASUB=/home/xdev/foundries.io/reps/lmp-8mmini-factory-igor.repo/layers/meta-subscriber-overrides/recipes-bsp/bootfirmware-updates/bootfirmware-updates

export PATH=$CST:$PATH

cp -L ../../../../build-lmp/deploy/images/apalis-imx6/SPL-apalis-imx6 .
cp -L ../../../../build-lmp/deploy/images/apalis-imx6/u-boot-apalis-imx6.itb .

cp SPL-apalis-imx6 $METASUB/SPL
cp u-boot-apalis-imx6.itb $METASUB/u-boot.itb
