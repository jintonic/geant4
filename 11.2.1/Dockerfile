# Geant4 (>11.1) is pre-compiled on 64-bit AlmaLinux (https://geant4.org/download)
# So we target linux/amd64 platform (https://stackoverflow.com/a/60252669/1801749)
from --platform=linux/amd64 almalinux

# install pre-compiled Geant4 in /usr to avoid setting LD_LIBRARY_PATH
# change datasets location in /usr/bin/geant4-config to be ./data/
run <<EOT
rm -fr afs media mnt srv /root/.*cshrc && cd /usr
curl -LO https://cern.ch/geant4-data/releases/lib4.11.2.p01/Linux-g++11.4.1-Alma9.tar.gz
tar --no-same-owner -xf *.gz && rm -f *.gz README bin/geant4.*
sed -i -E 's|/build.{,74}Geant4/||g' bin/geant4-config
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

# https://stackoverflow.com/a/77683802/1801749
run cat <<EOT >> /etc/bashrc
GEANT4_DATA_DIR=~/geant4/data
# https://www.tecmint.com/customize-bash-colors-terminal-prompt-linux/
PS1="\[\e[32m\]\u@AlmaLinux:\[\e[34m\]\w \[\e[31m\]\$\[\e[m\] "
export PS1 GEANT4_DATA_DIR
alias ls="ls --color"
alias la="ls -AF"
alias ll="ls -lh"
# a simple command-line calculator
c() {
  awk "BEGIN { pi=4.0*atan2(1.0,1.0); o=pi/180.0; print $*; }"
}
EOT

# provide some easily accessible example commands
# --install-datasets needs to be run in ~/geant4 folder!
copy <<EOF /root/.bash_history
c 'sin(pi/2)'
c 'cos(90*o)'
alias
mingle
curl -LO https://github.com/jintonic/geant4/raw/main/compose.yml
geant4-config --help
geant4-config --version
geant4-config --features
geant4-config --check-datasets
geant4-config --install-datasets
history
EOF
# save data to a host folder
volume /root/geant4
# overwrite the default workdir /
workdir /root/geant4

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

# display some information on Docker Desktop Logs
# https://kodekloud.com/blog/keep-docker-container-running
cmd echo "Geant4.`geant4-config --version` pre-compiled on" >> /tmp/info \
 && echo "`cat /etc/redhat-release`" >> /tmp/info \
 && echo 'Switch to the "Exec" tab for an interactive shell' >> /tmp/info \
 && tail -f /tmp/info
