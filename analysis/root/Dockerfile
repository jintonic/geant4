# fedora has ROOT in its package repo, ubuntu doesn't
from fedora

# overwrite the maintainer of fedora image
label maintainer="Jing Liu"<jing.liu@usd.edu>

# https://hub.docker.com/r/fedora/container-best-practices/dockerfile
run dnf update -y && dnf clean all

run dnf install -y root root-gui-webdisplay root-gui-fitpanel \
  && dnf clean all && rm -fr /var/cache/* root/*.log root/*.cfg

run curl -LO https://github.com/dylanaraps/fff/raw/refs/heads/master/fff \
  && sed -i -e '/text\//i application\/octet-stream*) \
  clear_screen; reset_terminal; root -l "\$1"; setup_terminal; redraw ;;' \
  -e '2,${/^ *#/d}' -e '/^ *$/d' fff && chmod 755 fff && mv fff /usr/bin

run cat >> /etc/bashrc <<EOT 
  FFF_COL2=4
  FFF_FAV4=~/geant4
  FFF_FAV9=/usr/share/doc/root/tutorials
  PS1="\[\e[32m\]\u@fedora:\[\e[34m\]\w \[\e[31m\]\$\[\e[m\] "
  export FFF_COL2 FFF_FAV4 FFF_FAV9 PS1
  alias ls="ls --color"
  alias la="ls -AF"
  alias ll="ls -lh"
  l() {
    fff "\$@"
    cd "\$(cat "\${XDG_CACHE_HOME:=\${HOME}/.cache}/fff/.fff_d")"
  }
EOT

# fine tune ROOT configurations
copy .rootrc /root/
# set default drawing style
copy rootlogon.C /usr/share/root/macros/

# overwrite the default working directory: /
workdir /root/
