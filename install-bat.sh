#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[@]}")"

source "$SCRIPT_DIR/utils.sh"

if ! type bat &>/dev/null; then
    echoinfo "Installing bat"
    if sudo apt install bat; then
        echoinfo "Finished installing batcat"
    else
        echoinfo "Failed to install bat"
        exit 1
    fi
    echoinfo "Creating symbolic link from batcat -> bat"
    mkdir -p "$HOME/.local/bin"
    ln -s "/usr/bin/batcat" "$HOME/.local/bin/bat"
    echoinfo "Finished creating symbolic link from batcat -> bat"
    echoinfo "Finished installing bat"
else
    echoinfo "bat found, skipping"
fi
