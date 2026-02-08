ARG VERSION=9
# the latest almalinux is 10, but Geant4 binary release was compiled on 9
FROM almalinux:${VERSION}

# install tools to compile Geant4 applications
# - `cmake` requires `make`, `which` is needed when run `make`
# - `wget` and `which` are needed by `antigravity` to install extensions
# - `mesa-libGL`, `libXmu`, `expat` are needed to compile Geant4 applications
# - their -devel packages are needed to provide unversioned .so files
RUN <<EOT
dnf install -y gcc-c++ cmake wget which mesa-libGL-devel libXmu-devel expat-devel
dnf clean all && rm -fr var/cache/* afs media mnt srv opt root/.*cshrc
EOT

# provide some example commands
COPY bash_history /etc/

# inject welcome.sh, customize.sh, inject_history.sh, 99-geant4.sh to
# - print welcome message
# - customize bash prompt
# - inject example commands into bash history
# - set Geant4 environment variables
COPY *.sh /etc/profile.d/

# overwrite the default workdir /
# putting it under /root makes it easier to find with cd and g h in yazi
# because macOS and Windows Docker users get into the container as root
WORKDIR /root/geant4
# ensure an anonymous volume is created if no host folder is bound to /root/geant4
VOLUME /root/geant4

# change /bin/sh to /bin/bash in Docker Desktop "Exec" tab
# because /bin/sh sources the file specified by $ENV
ENV ENV=/etc/bashrc

# Set Geant4 environment variables
# for Docker non-interactive shell
ENV BASH_ENV=/etc/profile.d/99-geant4.sh
# for Apptainer users
RUN mkdir -p /.singularity.d/env/ && \
    ln -s /etc/profile.d/99-geant4.sh /.singularity.d/env/99-geant4.sh

# use tini as the init in a container to clear zombie processes
RUN <<EOT
curl -Lo /tini https://github.com/krallin/tini/releases/latest/download/tini-amd64
chmod +x /tini
EOT
# -g sends signal to all processes, not just the immediate child process
# -- is for separating tini options from the command
ENTRYPOINT ["/tini", "-g", "--"]

# display some information on Docker Desktop "Logs" tab and
# https://kodekloud.com/blog/keep-docker-container-running
CMD . /etc/profile.d/welcome.sh >> /tmp/info && \
    echo 'Switch to the "Exec" tab in Docker Desktop for an interactive shell, or' >> /tmp/info && \
    echo 'Run the following command in a host terminal to attach to this container' >> /tmp/info && \
    echo '    docker exec -it '${HOSTNAME}' bash' >> /tmp/info && \
    tail -n 100 -f /tmp/info
