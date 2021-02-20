#!/bin/bash

set -e

cp flash_fuses.uuu mfgtool-files/

sudo mfgtool-files/uuu -pp 1 mfgtool-files/flash_fuses.uuu
