#!/bin/sh
# NOTE: this only works on Linux/WSL/Mac
gears listUnits.mac | sed -n '/^.*Table of Units.*/,$p' | tee units.txt
