#!/bin/sh
# Set sane defaults for Geant4 environment variables

# prevent Geant4 warning about missing PHYSLIST definition
if [ -z "$PHYSLIST" ]; then export PHYSLIST=FTFP_BERT; fi
# no need to enable multi-threading in a container
if [ -z "$G4RUN_MANAGER_TYPE" ]; then export G4RUN_MANAGER_TYPE=Serial; fi
# avoid OpenGL related visualization drivers in a container
if [ -z "$G4VIS_DEFAULT_DRIVER" ]; then export G4VIS_DEFAULT_DRIVER=TSG_FILE; fi
# set the default datasets directory
if [ -z "$GEANT4_DATA_DIR" ]; then export GEANT4_DATA_DIR="$HOME/geant4/datasets"; fi
