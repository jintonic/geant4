#!/bin/sh
# NOTE: this only works on Linux/WSL/Mac
gears listProcesses.mac | sed -n '/^Coupled.*$/,$p' | tee processes.txt
