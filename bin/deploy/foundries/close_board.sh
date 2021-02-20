#!/bin/bash

set -e

cp close_board.uuu mfgtool-files/

sudo mfgtool-files/uuu -pp 1 mfgtool-files/close_board.uuu
