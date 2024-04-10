# https://hub.docker.com/r/physino/geant4
from physino/geant4:11.2.1

# install git, tmux, micro, lf, gears, uproot, visidata, mpld3, seaborn, pandas
run <<APPS
dnf install -y git tmux python3-pip
cd /usr/local/bin && curl https://getmic.ro/r | bash
curl -LO https://github.com/jintonic/gears/raw/master/gears.cc
curl -LO https://github.com/jintonic/gears/raw/master/Makefile
make && rm -f gears.cc Makefile && mkdir -p /etc/lf
curl -LO https://github.com/gokcehan/lf/releases/download/r31/lf-linux-amd64.tar.gz
tar xf *.gz && rm -f *.gz && dnf clean all && rm -fr /var/cache/*
pip install uproot visidata mpld3 seaborn pandas && rm -fr /root/.cache
APPS

# set up environment
copy tmux.conf /etc/
copy lfrc /etc/lf/

# https://stackoverflow.com/a/27921346/1801749
run cat <<'BASHRC' >> /etc/bashrc
alias t='tmux -u'
alias ta='t attach'
alias tl='t new lf'
# https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh
l() {
  lf -last-dir-path=/tmp/lfdir "$@"
  cd "$(cat /tmp/lfdir)"
}
# a simple command-line calculator
c() {
  awk "BEGIN { pi=4.0*atan2(1.0,1.0); o=pi/180.0; print $*; }"
}
BASHRC

run cat <<EOF >> /root/.bash_history
git clone https://github.com/jintonic/geant4.git .
git clone https://github.com/jintonic/mingle.git
git clone https://github.com/jintonic/gears.git
gears
l
c 'sin(pi/2)'
c 'cos(90*o)'
EOF

run echo 'options.disp_canvas_charset = " +"' >> /root/.visidatarc \
 && sed -i 's/bash/tmux -u/' /root/.profile

# lf started by tmux uses vi without the following line
env EDITOR=micro

