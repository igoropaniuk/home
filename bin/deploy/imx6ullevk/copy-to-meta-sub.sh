#!/bin/bash

set -e

CURR=$PWD
LMP_TOOLS=~/foundries.io/reps/lmp-8mmini-factory-igor.repo/tools/lmp-tools/security/imx_hab4/
CST=~/foundries.io/tools/cst-3.3.1/linux64/bin
METASUB=/home/xdev/foundries.io/reps/lmp-8mmini-factory-igor.repo/layers/meta-subscriber-overrides/recipes-bsp/bootfirmware-updates/bootfirmware-updates

export PATH=$CST:$PATH

cp -L ../../../../build-lmp/deploy/images/imx6ullevk/SPL-imx6ullevk .
cp -L ../../../../build-lmp/deploy/images/imx6ullevk/u-boot-imx6ullevk.itb .

cp SPL-imx6ullevk $METASUB/SPL
cp u-boot-imx6ullevk.itb $METASUB/u-boot.itb
