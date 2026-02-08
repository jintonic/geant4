#!/bin/sh
# only show the welcome message once
if [ -f /tmp/welcome ]; then return; fi

# detect host OS via kernel fingerprint
if grep -qi "microsoft" /proc/version; then HOST_OS="Windows"
elif grep -qi "linuxkit" /proc/version; then HOST_OS="macOS"
else HOST_OS="Linux"
fi

# detect container engine type via environment variables
ENGINE="Docker"
if [ -n "$APPTAINER_CONTAINER" ] || [ -n "$SINGULARITY_CONTAINER" ]; then
    ENGINE="Apptainer"
else
    if [ "$HOST_OS" = "Linux" ]; then
        echo "ADVICE: consider using Apptainer instead of Docker in Linux."
    fi
fi
echo "ENGINE: $ENGINE on $HOST_OS"
echo "CONTAINER: $(cat /etc/redhat-release)"
echo "COMPILER: $(g++ --version | head -n 1)"
echo "CMAKE: $(cmake --version | head -n 1)"

if [ -f /usr/bin/fresh ]; then
    echo "FILE EDITOR: $(fresh --version) (f↵ to launch; mouse enabled)"
fi
if [ -f /usr/bin/yazi ]; then
    echo "FILE MANAGER: $(yazi --version) (y↵ to launch; mouse enabled)"
fi
if [ -f /usr/bin/tmux ]; then
    echo "TERMINAL MULTIPLEXER: $(tmux -V) (t↵ to launch; mouse enabled; \`? for help)"
fi

# print information about Geant4 if geant4-config is available
if [ -f /usr/bin/geant4-config ] && [ -n "$PS1" ]; then
    echo "geant4-config --version: $(geant4-config --version)"
    echo "geant4-config --prefix: $(geant4-config --prefix)"
    echo "geant4-config --check-datasets:"
    n=$(geant4-config --check-datasets | grep NOTFOUND | wc -l)
    if [ "$n" -gt 0 ]; then
        echo "$n missing datasets can be installed to ${GEANT4_DATA_DIR}"
        echo "using the following command brought up by ↑ key"
        echo "        geant4-config --install-datasets"
    else
        echo "All datasets are installed in ${GEANT4_DATA_DIR}"
    fi
fi

# check for mounted folder type (mapped host folder or anonymous volume)
N_ANONYMOUS_VOLUME=$(grep "volumes" /proc/self/mountinfo | grep "/root/geant4" | wc -l)
if [ $N_ANONYMOUS_VOLUME -gt 0 ]; then # warning for anonymous volumes
    echo "WARNING: /root/geant4 is mapped to an anonymous volume instead of a host folder."
    echo "         The volume will be deleted when the container is deleted."
    echo "         Did you forget to bind mount a host folder to /root/geant4?"
else # warning for Linux root users on Docker bind mount
    if [ "$HOST_OS" = "Linux" ] && [ "$(id -u)" = "0" ] && [ "$ENGINE" = "Docker" ]; then
        echo "WARNING: You are running as root in the container."
        echo "         Files created in /root/geant4 need sudo to delete on the host folder."
        echo "         Did you forget to specify the user when launching the container?"
    fi
fi

# tip for non-root users (Linux Docker users)
if [ "$(id -u)" != "0" ] && [ "$ENGINE" = "Docker" ]; then
    echo "ROOT ACCESS: docker exec -u 0 -it $HOSTNAME bash"
fi

touch /tmp/welcome
