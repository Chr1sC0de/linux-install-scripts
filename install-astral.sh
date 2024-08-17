#!/bin/bash

: '
Install rye, it already ships with uv
'

if ! type rye &>/dev/null; then
    echo "INFO: rye not installed, installing"
    curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
    echo "INFO: rye finished installing"
    ehco "INFO"
    mkdir -p ~/.local/share/bash-completion/completions
    source "$HOME/.rye/env"
    rye self completion >~/.local/share/bash-completion/completions/rye.bash
else
    echo "INFO: rye already installed"
fi

if ! type uv &>/dev/null; then
    echo "INFO: uv not installed, installing"
    curl -LsSf https://astral.sh/uv/install.sh | sh
    echo "INFO: finished installing uv"
else
    echo "INFO: uv already installed"
fi
