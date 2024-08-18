#! /bin/bash

: '
dependencies for bash ide language server
'

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"

source "$SCRIPT_DIR/utils.sh"

if type code &>/dev/null; then
    echoinfo "VSCode found installing shellcheck for bash ide"
    apt install shellcheck
    if [[ $? -eq 0 ]]; then
        echoinfo "Finished installing shellcheck"
    else
        echoinfo "Failed to install shellcheck"
    fi
else
    echoinfo "VSCode not found skipping installation of shellcheck, install shellcheck from Mason for neovim"
fi
