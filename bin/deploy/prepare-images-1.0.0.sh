#!/bin/bash

TORADEXDIR=$HOME/toradex

OPTEE_OUT=$TORADEXDIR/reps/imx-optee-os.git
OPTEE_BIN=$OPTEE_OUT/build.mx8qmmek/tee.bin

cp ./scfw/mx8qm-apalis-scfw-tcm.bin iMX8QM/scfw_tcm.bin
cp ../imx-atf/build/imx8qm/release/bl31.bin iMX8QM/
cp ../u-boot-toradex.git/u-boot-dtb.bin iMX8QM/u-boot.bin
cp ../u-boot-toradex.git/spl/u-boot-spl.bin iMX8QM/
# Copy AHAB container (https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-seco-2.5.4.bin)
cp ./firmware-imx-8.0/firmware/seco/mx8qm-ahab-container.img iMX8QM/
#cp $OPTEE_BIN iMX8QM/

make SOC=iMX8QM flash_b0_spl_container
#recovery_imx8 iMX8QM/flash.bin
sudo cp iMX8QM/flash.bin ~/toradex/tftp/
