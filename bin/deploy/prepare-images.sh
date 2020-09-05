#!/bin/bash

TORADEXDIR=$HOME/toradex

OPTEE_OUT=$TORADEXDIR/reps/imx-optee-os.git
OPTEE_BIN=$OPTEE_OUT/build.imx-mx8qmmek/tee.bin

cp ../imx-scfw/src/scfw_export_mx8qm_b0/mx8qm-apalis-scfw-tcm.bin iMX8QM/scfw_tcm.bin
cp ../imx-atf/build/imx8qm/release/bl31.bin iMX8QM/
cp ../u-boot-toradex.git/u-boot-dtb.bin iMX8QM/u-boot.bin
cp ../u-boot-toradex.git/spl/u-boot-spl.bin iMX8QM/
# Copy AHAB container (https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-seco-2.5.4.bin)
cp ./imx-seco-2.5.6/firmware/seco/mx8qmb0-ahab-container.img iMX8QM/
#cp $OPTEE_BIN iMX8QM/

make SOC=iMX8QM flash_b0
#recovery_imx8 iMX8QM/flash.bin
sudo cp iMX8QM/flash.bin ~/toradex/tftp/
