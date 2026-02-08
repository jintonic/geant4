# use a base image prepared for Geant4
FROM physino/almalinux:9

# install pre-compiled Geant4 in /usr to avoid setting LD_LIBRARY_PATH
#   --strip-components=1 is used to skip folder Geant4-*-Linux/ in gz file
#   --no-same-owner is used to avoid introducing user/group unknown to the image
# change datasets location in geant4-config to be $GEANT4_DATA_DIR
#   {,100} specifies the range to search for 'data' after 'afs'
RUN <<EOT
cd /usr
curl -LO https://cern.ch/geant4-data/releases/lib4.11.3/Linux-g++11.5.0-Alma9.tar.gz
tar --no-same-owner --strip-components=1 -xf *.gz && rm -f *.gz README bin/geant4.*
sed -i -E "s|/afs.{,100}data|'\$GEANT4_DATA_DIR'|g" bin/geant4-config
EOT

# install mingle and gears to verify the installation
RUN <<EOT
curl -LO https://github.com/jintonic/mingle/raw/main/CMakeLists.txt
curl -LO https://github.com/jintonic/mingle/raw/main/mingle.cc
cmake . && make install && rm -fr mingle* *ake* *.txt
curl -LO https://github.com/jintonic/gears/raw/master/CMakeLists.txt
curl -LO https://github.com/jintonic/gears/raw/master/gears.cc
cmake . && make install && rm -fr gears* *ake* *.txt
EOT
