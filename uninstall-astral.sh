#!/bin/bash

: '
uninstall astral environment
'

echo "INFO: uninstalling astral environment"

FILES=(
    "$HOME/.cargo/bin/uv"
    "$HOME/.cargo/bin/uvx"
)
DIRECTORIES=(
    "$HOME/.rye"
)

for FILE in "${FILES[@]}"; do
    if [[ -f "$FILE" ]]; then
        echo "INFO: $FILE found, removing"
        rm "$FILE"
        echo "INFO: finished removing $FILE"
    else
        echo "INFO: $FILE not found"
    fi
done

for DIRECTORY in "${DIRECTORIES[@]}"; do
    if [[ -d "$DIRECTORY" ]]; then
        echo "INFO: $DIRECTORY found, removing"
        rm "$DIRECTORY" -rf
        echo "INFO: finished removing $DIRECTORY"
    else
        echo "INFO: $DIRECTORY not found"
    fi
done

rm "$HOME/.local/share/bash-completion/completions/rye.bash"

echo "INFO: fininshed uninstalling astral environment, remember to remove . '$HOME/.rye/env' from profile"
