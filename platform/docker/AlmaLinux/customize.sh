#!/bin/sh

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
