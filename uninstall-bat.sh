#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[@]}")"

source "$SCRIPT_DIR/utils.sh"

if type bat &>/dev/null; then
    echoinfo "bat found, uninstalling"

    echoinfo "Removing batcat"
    sudo apt-get purge bat -y
    echoinfo "Finished removing batcat"

    echoinfo "Removing bat symlink"
    rm -f "$HOME/.local/bin/bat"
    echoinfo "Finished removing bat symlink"

    echoinfo "finished uninstall bat"
else
    echoinfo "bat not found, skipping uninstall"
fi
