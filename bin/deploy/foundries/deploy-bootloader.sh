#!/bin/bash

set -e

CURR=$PWD
LMP_TOOLS=~/foundries.io/reps/lmp-8mmini-factory-igor.repo/tools/lmp-tools/security/imx_hab4/
CST=~/foundries.io/tools/cst-3.3.1/linux64/bin

export PATH=$CST:$PATH

#rm imx-boot-imx8mmevk.signed
cp -L ../../../../build-lmp/deploy/images/imx8mmevk/imx-boot-imx8mmevk .
cp -L ../../../../build-lmp/deploy/images/imx8mmevk/u-boot-imx8mmevk.itb .
cp bootloader.uuu mfgtool-files/

cd $LMP_TOOLS
./sign-file.sh --spl $CURR/imx-boot-imx8mmevk
./sign-file.sh --spl $CURR/mfgtool-files/imx-boot-mfgtool
cd $CURR

echo "Generate Secondary Boot table"
sector_num=`printf "0x1000"`

sed -e s/%sectornum%/${sector_num}/g sit_template > sit_gen
chmod +x sit_gen

./sit_gen
objcopy -I binary -O binary --pad-to 512 sit.bin

rm sit_gen
echo "Generated sit.bin:"
hexdump -vC sit.bin

echo "Invoking uuu..."
sudo mfgtool-files/uuu -pp 1 mfgtool-files/bootloader.uuu
