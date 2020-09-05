#!/bin/bash

TORADEXDIR=$HOME/toradex

cp ../imx-scfw/src/scfw_export_mx8qm_b0/mx8qm-apalis-scfw-tcm.bin iMX8QM/scfw_tcm.bin
cp ../imx-atf/build/imx8qm/release/bl31.bin iMX8QM/
cp ../u-boot-toradex.git/u-boot-dtb.bin iMX8QM/u-boot.bin
cp ./imx-seco-3.6.3/firmware/seco/mx8qmb0-ahab-container.img iMX8QM/

make SOC=iMX8QM flash
~/bin/recovery_imx8 iMX8QM/flash.bin
