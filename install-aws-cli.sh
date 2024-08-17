#!/bin/bash

: '
install the aws cli
'

if ! type aws &>/dev/null; then
    echo "INFO: aws cli not installed, installing"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

    echo "INFO: cleaning remnants"
    rm -rf aws
    rm awscliv2.zip
    echo "INFO: finished cleaning remnants"
    echo "INFO: finished installing aws cli"
else
    echo "INFO: aws cli already installed"
fi
