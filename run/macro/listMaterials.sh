#!/bin/sh
# NOTE: this only works on Linux/WSL/Mac
gears listMaterials.mac | sed -n '/^===.*$/,$p' | tee materials.txt
