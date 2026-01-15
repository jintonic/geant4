# https://hub.docker.com/r/physino/geant4
from physino/geant4:11.4.0

# install git, tmux, fresh, yazi, gears, wget, uproot, visidata, seaborn, pandas
# psutil is used by visidata, procps-ng provides pkill and ps
# ps and wget are used by VS Code to install extensions
run <<APPS
dnf install -y git tmux python3-pip python3-psutil procps-ng wget dnf-plugins-core \
https://github.com/sinelaw/fresh/releases/download/v0.1.77/fresh-editor-0.1.77-1.x86_64.rpm
dnf copr enable -y lihaohong/yazi
dnf install -y yazi --setopt=install_weak_deps=False
curl -LO https://github.com/jintonic/gears/raw/master/gears.cc
curl -LO https://github.com/jintonic/gears/raw/master/CMakeLists.txt
cmake . && make install && rm -fr gears* *ake* *.txt
dnf clean all && rm -fr /var/cache/*
pip install uproot visidata seaborn pandas && rm -fr /root/.cache
APPS

# set up environment
copy tmux.conf /etc/
copy yazi/keymap.toml /root/.config/yazi/keymap.toml

# https://stackoverflow.com/a/27921346/1801749
run cat <<'BASHRC' >> /etc/bashrc
export MPLBACKEND=PDF
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

run cat <<EOF >> /root/.bash_history
git clone https://github.com/jintonic/geant4.git .
gears
ty
EOF

run echo 'options.disp_canvas_charset = " +"' >> /root/.visidatarc \
 && sed -i 's/bash/tmux -u/' /root/.profile

# yazi uses vi without the following line
env EDITOR=fresh
