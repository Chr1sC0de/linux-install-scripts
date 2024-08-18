#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[@]}")"

source "$SCRIPT_DIR/utils.sh"

REPO="https://github.com/tomblind/local-lua-debugger-vscode"
REPO_NAME="${REPO##*/}"
WRITE_LOCATION="$HOME/.$REPO_NAME"

if [[ ! -d $WRITE_LOCATION ]]; then
    echoinfo "$REPO_NAME not found, installing"
    git clone $REPO "$WRITE_LOCATION"
    (
        cd "$WRITE_LOCATION" || exit 1 &&
            npm install &&
            npm run build
    )

    echoinfo "finished installing $REPO_NAME"
else
    echoinfo "$REPO_NAME found, skipping installation"
fi
