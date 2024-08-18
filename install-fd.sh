#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[@]}")"

source "$SCRIPT_DIR/utils.sh"

if ! type fdfind &>/dev/null; then
    echoinfo "Installing fd"
    echoinfo "fdfind not found, installing"
    sudo apt install fd-find
    echoinfo "Finished installing fdfind"

    echoinfo "Creating symlink fdfind -> fd"
    ln -s "$(which fdfind)" "$HOME/.local/bin/fd"
    echoinfo "Finished creating symlink fdfind -> fd"

    echoinfo "Finished installing fd"
else
    echoinfo "fdfind found, skipping installation"
fi
