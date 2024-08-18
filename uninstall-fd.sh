#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[@]}")"

source "$SCRIPT_DIR/utils.sh"

if type fdfind &>/dev/null; then
    echoinfo "Uninstalling fd"
    echoinfo "fdfind found, uninstalling"
    sudo apt remove --purge fd-find
    # force the removal of fd-find
    sudo dpkg --force-depends --purge fd-find
    sudo rm "$(which fdfind)"
    echoinfo "Finished uninstalling fdfind"

    echoinfo "Removing symlink fdfind -> fd"
    rm -f "$HOME/.local/bin/fd"
    echoinfo "Finished creating symlink fdfind -> fd"

    echoinfo "Finished installing fd"
else
    echoinfo "fdfind found, skipping installation"
fi
