#!/bin/sh
# only show the welcome message once
if [ "X$WELCOME_MESSAGE_SHOWN" != "X" ]; then return; fi

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

# print information about Geant4 if geant4-config is available
if [ -f /usr/bin/geant4-config ]; then
    echo "geant4-config --version: $(geant4-config --version)"
    echo "geant4-config --prefix: $(geant4-config --prefix)"
    echo "geant4-config --check-datasets:"
    geant4-config --check-datasets | grep NOTFOUND
    nMissing=$(geant4-config --check-datasets | grep NOTFOUND | wc -l)
    if [ "$nMissing" -gt 0 ]; then
        echo "Missing datasets can be installed to ${GEANT4_DATA_DIR} using"
        echo "        geant4-config --install-datasets"
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

# https://www.tecmint.com/customize-bash-colors-terminal-prompt-linux/
PS1="\[\e[31m\]\u\[\e[33m\]@\[\e[32m\]\h\[\e[36m\]:\[\e[34m\]\w\[\e[35m\];) \[\e[m\]"

alias ls="ls --color"
alias a="ls -AF"
alias l="ls -Alh"
alias ..="cd .."
alias ...="cd ../.."

# a simple command-line calculator
c() {
  awk "BEGIN { pi=4.0*atan2(1.0,1.0); o=pi/180.0; print \$*; }"
}

export WELCOME_MESSAGE_SHOWN=1
