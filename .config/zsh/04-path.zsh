#!/usr/bin/env zsh

export PATH="/home/occhima/.local/bin:/home/occhima/.cargo/bin:/home/occhima/go/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm

[ -f "/home/occhima/.ghcup/env" ] && source "/home/occhima/.ghcup/env" # ghcup-env

