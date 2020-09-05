#!/bin/bash

TORADEXDIR=$HOME/toradex

cp ../imx-scfw/src/scfw_export_mx8qx_b0/mx8qx-colibri-scfw-tcm.bin iMX8QX/scfw_tcm.bin
cp ../imx-atf/build/imx8qx/release/bl31.bin iMX8QX/
cp ../u-boot-toradex.git/u-boot.bin iMX8QX/u-boot.bin
cp ./imx-seco-3.6.3/firmware/seco/mx8qxb0-ahab-container.img iMX8QX/

make SOC=iMX8QX flash
~/bin/recovery_imx8 iMX8QX/flash.bin
