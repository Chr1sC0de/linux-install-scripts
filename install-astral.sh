#!/bin/bash

: '
Install rye, it already ships with uv
'

if ! type rye &>/dev/null; then
    echoinfo "Rye not installed, installing"
    curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
    echoinfo "Rye finished installing"

    echoinfo "Adding rye completions"
    mkdir -p ~/.local/share/bash-completion/completions
    # shellcheck disable=SC1091
    source "$HOME/.rye/env"
    rye self completion >~/.local/share/bash-completion/completions/rye.bash
    echoinfo "Finished adding rye completions"
else
    echoinfo "Rye already installed, skipping"
fi

if ! type uv &>/dev/null; then
    echoinfo "Uv not installed, installing"
    curl -LsSf https://astral.sh/uv/install.sh | sh
    echoinfo "Finished installing uv"
else
    echoinfo "Uv already installed, skipping"
fi
