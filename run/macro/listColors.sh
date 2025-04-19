#!/bin/sh
# NOTE: this only works on Linux/WSL/Mac
gears listColors.mac | grep 'Available c' | tr ',' '\n' | tee colors.txt
