# use a base image prepared for Geant4
FROM physino/almalinux:9

# install pre-compiled Geant4 in /usr to avoid setting LD_LIBRARY_PATH
#   --strip-components=2 is used to skip folder Geant4-11.4-Linux/ in gz file
#   --no-same-owner is used to avoid introducing user/group unknown to the image
# change datasets location in geant4-config to be $GEANT4_DATA_DIR
#   {,100} specifies the range to search for 'data' after 'afs'
RUN <<EOT
cd /usr
curl -LO https://cern.ch/geant4-data/releases/lib4.11.4/Linux-g++11.5.0-Alma9.tar.gz
tar --no-same-owner --strip-components=2 -xf *.gz && rm -f *.gz README bin/geant4.*
sed -i -E "s|/afs.{,100}data|'\$GEANT4_DATA_DIR'|g" bin/geant4-config
EOT

# add HepRepFile to the container
COPY . /root/geant4
RUN cmake . && make install && rm -fr include src *ake* *.txt README* *.so History

# install mingle and gears to verify the installation
RUN <<EOT
curl -LO https://github.com/jintonic/mingle/raw/heprep/CMakeLists.txt
curl -LO https://github.com/jintonic/mingle/raw/heprep/mingle.cc
cmake . && make install && rm -fr mingle* *ake* *.txt
curl -LO https://github.com/jintonic/gears/raw/heprep/CMakeLists.txt
curl -LO https://github.com/jintonic/gears/raw/heprep/gears.cc
cmake . && make install && rm -fr gears* *ake* *.txt
EOT
