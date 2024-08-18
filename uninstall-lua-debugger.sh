#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[@]}")"

source "$SCRIPT_DIR/utils.sh"

REPO="https://github.com/tomblind/local-lua-debugger-vscode"
REPO_NAME="${REPO##*/}"
WRITE_LOCATION="$HOME/.$REPO_NAME"

if [[ -d $WRITE_LOCATION ]]; then
    echoinfo "$REPO_NAME found, uninstalling"
    rm -rf "$WRITE_LOCATION"
    echoinfo "finished uninstalling $REPO_NAME"
else
    echoinfo "$REPO_NAME not found, skipping uninstall"
fi
