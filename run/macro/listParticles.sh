#!/bin/sh
# NOTE: this only works on Linux/WSL/Mac
gears listParticles.mac | sed -n '/^.*B+.*$/,$p' | tee particles.txt
