# https://hub.docker.com/r/physino/geant4
from physino/geant4:11.3.2

# install git, tmux, micro, lf, gears, uproot, visidata, seaborn, pandas, mdv
# tornado is used by matplotlib's WebAgg, psutil is used by visidata
# procps-ng provides pkill and ps, they are needed to kill tornado in bg
run <<APPS
dnf install -y git tmux python3-pip python3-tornado python3-psutil procps-ng
cd /usr/local/bin && curl https://getmic.ro/r | bash
curl -LO https://github.com/jintonic/gears/raw/master/gears.cc
curl -LO https://github.com/jintonic/gears/raw/master/Makefile
make && rm -f gears.cc Makefile && mkdir -p /etc/lf
curl -LO https://github.com/gokcehan/lf/releases/download/r31/lf-linux-amd64.tar.gz
tar xf *.gz && rm -f *.gz && dnf clean all && rm -fr /var/cache/*
pip install uproot visidata seaborn pandas mdv && rm -fr /root/.cache
APPS

# set up environment
copy tmux.conf /etc/
copy lfrc /etc/lf/
copy micro /root/.config/micro
copy matplotlibrc /root/.config/matplotlib/

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
BASHRC

run cat <<EOF >> /root/.bash_history
git clone https://github.com/jintonic/geant4.git .
git clone https://github.com/jintonic/mingle.git
git clone https://github.com/jintonic/gears.git
gears
l
EOF

run echo 'options.disp_canvas_charset = " +"' >> /root/.visidatarc \
 && sed -i 's/bash/tmux -u/' /root/.profile

# lf started by tmux uses vi without the following line
env EDITOR=micro

# for WebAgg backend for Matplotlib, up to two plots
expose 8888 8889
