#!/bin/bash

: '
install the aws cli
'

if ! type aws &>/dev/null; then
    echoinfo "aws cli not installed, installing"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

    echoinfo "Cleaning remnants"
    rm -rf aws
    rm awscliv2.zip
    echoinfo "Finished cleaning remnants"
    echoinfo "Finished installing aws cli"
else
    echoinfo "aws cli already installed"
fi
