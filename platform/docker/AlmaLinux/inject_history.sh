#!/bin/sh
# inject common commands to history in ram for an interactive shell
if [ -z "$PS1" ]; then return; fi
history -r /etc/bash_history
