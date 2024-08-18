#!/bin/bash

: '
uninstall astral environment
'

echoinfo "uninstalling astral environment"

FILES=(
    "$HOME/.cargo/bin/uv"
    "$HOME/.cargo/bin/uvx"
)
DIRECTORIES=(
    "$HOME/.rye"
)

for FILE in "${FILES[@]}"; do
    if [[ -f "$FILE" ]]; then
        echoinfo "$FILE found, removing"
        rm "$FILE"
        echoinfo "finished removing $FILE"
    else
        echoinfo "$FILE not found"
    fi
done

for DIRECTORY in "${DIRECTORIES[@]}"; do
    if [[ -d "$DIRECTORY" ]]; then
        echoinfo "$DIRECTORY found, removing"
        rm "$DIRECTORY" -rf
        echoinfo "finished removing $DIRECTORY"
    else
        echoinfo "$DIRECTORY not found"
    fi
done

rm "$HOME/.local/share/bash-completion/completions/rye.bash"

echoinfo "fininshed uninstalling astral environment, remember to remove . '$HOME/.rye/env' from profile"
