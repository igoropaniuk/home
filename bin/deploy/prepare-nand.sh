#!/bin/bash

build_uboot_mainline_imx7_nand
objcopy -I binary -O binary --pad-to 0xa7c00 --gap-fill=0x00 u-boot-dtb.imx u-boot-dtb.imx.zero-padded
dd if=u-boot-dtb.imx.zero-padded of=u-boot-dtb.imx.ready bs=1024 seek=1
cp u-boot-dtb.imx.ready ~/toradex/tftp/
