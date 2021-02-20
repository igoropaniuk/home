#!/bin/bash

set -e

cp disable_mfg.uuu mfgtool-files/

sudo mfgtool-files/uuu -pp 1 mfgtool-files/disable_mfg.uuu
