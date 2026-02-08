# https://hub.docker.com/r/physino/geant4
FROM physino/geant4:11.4.0

# install tmux, fresh, yazi, procps-ng
#   chafa is used by yazi for image preview
#   poppler-utils is used by yazi for pdf preview
#   procps-ng provides pkill and ps
#   ps is used by VS Code to install extensions
RUN <<APPS
dnf install -y tmux procps-ng epel-release dnf-plugins-core \
https://github.com/sinelaw/fresh/releases/download/v0.1.99/fresh-editor-0.1.99-1.x86_64.rpm
dnf config-manager --set-enabled crb
dnf copr enable -y lihaohong/yazi
dnf install -y yazi chafa poppler-utils --setopt=install_weak_deps=False
dnf clean all && rm -fr /var/cache/*
APPS

# set up environment
COPY tmux.conf /etc/
COPY yazi /etc/yazi/

# https://stackoverflow.com/a/27921346/1801749
RUN cat <<'EOT' >> /etc/profile.d/setup.sh
alias f='fresh'
alias t='tmux -u'
alias ta='t attach'
alias ty='t new-window yazi'
# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
EOT

ENV EDITOR=fresh
ENV YAZI_CONFIG_HOME=/etc/yazi
