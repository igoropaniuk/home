#!/bin/bash

TORADEXDIR=$HOME/toradex

cp ../imx-atf/build/imx8mm/release/bl31.bin iMX8M/
cp ../u-boot-toradex.git/u-boot-nodtb.bin iMX8M/u-boot-nodtb.bin
cp ../u-boot-toradex.git/arch/arm/dts/imx8mm-verdin.dtb iMX8M/fsl-imx8mm-evk.dtb
cp ../u-boot-toradex.git/spl/u-boot-spl.bin iMX8M/
cp ../u-boot-toradex.git/tools/mkimage iMX8M/mkimage_uboot
cp firmware-imx-8.1.1/firmware/ddr/synopsys/lpddr* ./iMX8M

make SOC=iMX8MM flash_evk_emmc_fastboot
#~/bin/recovery_imx8 iMX8M/flash.bin
cp iMX8M/flash.bin ~/toradex/tftp/
