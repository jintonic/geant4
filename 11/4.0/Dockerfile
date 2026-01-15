# Geant4 (>11.1) is pre-compiled on 64-bit AlmaLinux (https://geant4.org/download)
# So we target linux/amd64 platform (https://stackoverflow.com/a/60252669/1801749)
# https://docs.docker.com/reference/build-checks/from-platform-flag-const-disallowed
# the latest almalinux is 10, but Geant4 11.4.0 was compiled on 9
FROM almalinux:9

# install pre-compiled Geant4 in /usr to avoid setting LD_LIBRARY_PATH
# --strip-components=2 is used to skip folder Geant4-11.4.0-Linux/ in gz file
# change datasets location in /usr/bin/geant4-config to be ./datasets/
# {,100} specifies the range to search for 'data' after 'afs'
# install tini as the init in a container to clear zombie processes
RUN <<EOT
rm -fr afs media mnt srv /root/.*cshrc && cd /usr && rm -fr games src
curl -LO https://cern.ch/geant4-data/releases/lib4.11.4/Linux-g++11.5.0-Alma9.tar.gz
tar --no-same-owner --strip-components=2 -xf *.gz && rm -f *.gz README bin/geant4.*
sed -i -E 's|/afs.{,100}data|datasets|g' bin/geant4-config
curl -Lo /tini https://github.com/krallin/tini/releases/latest/download/tini-amd64
chmod +x /tini
EOT

# compile and install MinGLE as a test of the Geant4 installation
# `cmake` requires `make`, `which` is needed when run `make`
# `mesa-libGL`, `libXmu`, `expat` are needed to compile Geant4 applications
# their -devel packages are needed to provide unversioned .so files
RUN <<EOT
dnf install -y gcc-c++ cmake which mesa-libGL-devel libXmu-devel expat-devel
dnf clean all && rm -fr /var/cache/*
curl -LO https://github.com/jintonic/mingle/raw/main/CMakeLists.txt
curl -LO https://github.com/jintonic/mingle/raw/main/mingle.cc
cmake . && make install && rm -fr mingle* *ake* *.txt
EOT

# https://stackoverflow.com/a/77683802/1801749
RUN cat <<EOT >> /etc/bashrc
PHYSLIST=FTFP_BERT
GEANT4_DATA_DIR=~/geant4/datasets
# https://www.tecmint.com/customize-bash-colors-terminal-prompt-linux/
PS1="\[\e[32m\]\u@AlmaLinux:\[\e[34m\]\w \[\e[31m\]\$\[\e[m\] "
export PS1 GEANT4_DATA_DIR PHYSLIST
alias ls="ls --color"
alias la="ls -AF"
alias ll="ls -lh"
# a simple command-line calculator
c() {
  awk "BEGIN { pi=4.0*atan2(1.0,1.0); o=pi/180.0; print \$*; }"
}
EOT

# provide some easily accessible example commands
# --install-datasets needs to be run in ~/geant4 folder!
COPY <<EOF /root/.bash_history
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
VOLUME /root/geant4
# overwrite the default workdir /
WORKDIR /root/geant4

# leave a message for Docker Desktop Exec tab
# https://stackoverflow.com/a/39622593/1801749
# https://www.baeldung.com/linux/bashrc-vs-bash-profile-vs-profile
COPY <<EOF /root/.profile
echo 'You are using /bin/sh'
echo 'Type \"bash↵\" for a better shell'
EOF
ENV ENV=/root/.profile

# no need to enable multi-threading in a container
ENV G4RUN_MANAGER_TYPE=Serial
# avoid OpenGL related visualization drivers in a container
ENV G4VIS_DEFAULT_DRIVER=TSG_FILE

# use https://github.com/krallin/tini to replace tail to clear zombie processes
ENTRYPOINT ["/tini", "--"]

# display some information on Docker Desktop Logs and
# https://kodekloud.com/blog/keep-docker-container-running
CMD echo "Geant4.`geant4-config --version` pre-compiled on" >> /tmp/info \
  && echo "`cat /etc/redhat-release` with" >> /tmp/info \
  && echo "`g++ --version | head -n 1`" >> /tmp/info \
  && echo 'Switch to the "Exec" tab for an interactive shell' >> /tmp/info \
  && tail -f /tmp/info
