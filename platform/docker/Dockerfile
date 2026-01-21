# https://hub.docker.com/r/physino/geant4
FROM physino/geant4:11.4.0

# install git, tmux, fresh, yazi, chafa, gears, wget, uproot, visidata, seaborn, pandas
# chafa is used by yazi for image preview
# psutil is used by visidata, procps-ng provides pkill and ps
# ps and wget are used by VS Code to install extensions
RUN <<APPS
dnf install -y git tmux python3-pip python3-psutil procps-ng wget epel-release dnf-plugins-core \
https://github.com/sinelaw/fresh/releases/download/v0.1.77/fresh-editor-0.1.77-1.x86_64.rpm
dnf config-manager --set-enabled crb
dnf copr enable -y lihaohong/yazi
dnf install -y yazi chafa
curl -LO https://github.com/jintonic/gears/raw/master/gears.cc
curl -LO https://github.com/jintonic/gears/raw/master/CMakeLists.txt
cmake . && make install && rm -fr gears* *ake* *.txt
dnf clean all && rm -fr /var/cache/*
pip install uproot visidata seaborn pandas && rm -fr /root/.cache
APPS

# set up environment
COPY tmux.conf /etc/
COPY yazi/keymap.toml /root/.config/yazi/keymap.toml
COPY yazi/yazi.toml /root/.config/yazi/yazi.toml

# https://stackoverflow.com/a/27921346/1801749
RUN cat <<'BASHRC' >> /etc/bashrc
export MPLBACKEND=Agg
alias t='tmux -u'
alias ta='t attach'
alias ty='t new yazi'
# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
BASHRC

RUN cat <<EOF >> /root/.bash_history
git clone https://github.com/jintonic/geant4.git .
gears
ty
EOF

RUN echo 'options.disp_canvas_charset = " +"' >> /root/.visidatarc \
 && sed -i 's/bash/tmux -u/' /root/.profile

# yazi uses vi without the following line
ENV EDITOR=fresh
