#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[@]}")"

source "$SCRIPT_DIR/utils.sh"

if type fzf &>/dev/null; then
    echoinfo "fzf command found, uninstalling"
    "$HOME/.fzf/uninstall"
    rm "$HOME/.fzf" -rf
    echoinfo "Finished uninstall fzf"
else
    echoinfo "fzf not found, skip uninstall"
fi
