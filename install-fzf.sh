#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[@]}")"

source "$SCRIPT_DIR/utils.sh"

if ! type fzf &>/dev/null; then
    echoinfo "fzf command not found installing"
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    "$HOME/.fzf/install"
    echoinfo "Finished installing fzf"
else
    echoinfo "fzf found, skipping installation"
fi
