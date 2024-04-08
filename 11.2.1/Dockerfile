# Geant4 (>11.1) is pre-compiled on 64-bit AlmaLinux (https://geant4.org/download)
# So we target linux/amd64 platform (https://stackoverflow.com/a/60252669/1801749)
from --platform=linux/amd64 almalinux

# install pre-compiled Geant4 in /usr to avoid setting LD_LIBRARY_PATH
# modify default datasets location in /usr/bin/geant4-config
# https://www.tecmint.com/customize-bash-colors-terminal-prompt-linux/
run <<EOT
rm -fr afs media mnt srv /root/.*cshrc && cd /usr
curl -LO https://cern.ch/geant4-data/releases/lib4.11.2.p01/Linux-g++11.4.1-Alma9.tar.gz
tar xf *.gz && rm -f *.gz README bin/geant4.*
sed -i -E 's|/build.{,74}Geant4/||g' bin/geant4-config
echo 'GEANT4_DATA_DIR=~/geant4/data' >> /etc/bashrc
echo 'PS1="\[\e[32m\]\u@AlmaLinux:\[\e[34m\]\w \[\e[31m\]\$\[\e[m\] "' >> /etc/bashrc
echo 'export PS1 GEANT4_DATA_DIR' >> /etc/bashrc
echo 'alias ls="ls --color"' >> /etc/bashrc
echo 'alias la="ls -AF"' >> /etc/bashrc
echo 'alias ll="ls -lh"' >> /etc/bashrc
echo 'alias l="ls -Alh"' >> /etc/bashrc
EOT

# compile and install MinGLE as a test of the Geant4 installation
# `cmake` requires `make`, `which` is needed when run `make`
# `mesa-libGL`, `libXmu`, `expat` are needed to compile Geant4 applications
# their -devel packages are needed to provide unversioned .so files
run <<EOT
dnf install -y gcc-c++ cmake which mesa-libGL-devel libXmu-devel expat-devel
dnf clean all && rm -fr /var/cache/* 
curl -LO https://github.com/jintonic/mingle/raw/main/CMakeLists.txt
curl -LO https://github.com/jintonic/mingle/raw/main/mingle.cc
cmake . && make install && rm -fr mingle* *ake* *.txt
EOT

# provide some easily accessible example commands
# https://docs.docker.com/reference/dockerfile/#here-documents
copy <<EOF /root/.bash_history
cat /etc/redhat-release
geant4-config --help
geant4-config --version
geant4-config --features
cd ~/geant4 && geant4-config --check-datasets
cd ~/geant4 && geant4-config --install-datasets
mingle
EOF

# leave a message for Docker Desktop Exec tab
# https://stackoverflow.com/a/39622593/1801749
# https://www.baeldung.com/linux/bashrc-vs-bash-profile-vs-profile
copy <<EOF /root/.profile
echo 'You are using /bin/sh'
echo 'Type \"bash↵\" for a better shell'
EOF
env ENV=/root/.profile

# no need to enable multi-threading in a container
env G4RUN_MANAGER_TYPE=Serial
# avoid using OpenGL related visualization drivers in a container
env G4VIS_DEFAULT_DRIVER=VRML2FILE

# save data to a host folder
volume /root/geant4

# overwrite the default workdir /
workdir /root

# display some information on Docker Desktop Logs
# https://kodekloud.com/blog/keep-docker-container-running
cmd echo "Geant4.`geant4-config --version` pre-compiled on" >> /tmp/info \
 && echo "`cat /etc/redhat-release`" >> /tmp/info \
 && echo 'Switch to the "Exec" tab for an interactive shell' >> /tmp/info \
 && tail -f /tmp/info
