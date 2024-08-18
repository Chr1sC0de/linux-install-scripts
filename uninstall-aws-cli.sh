#!/bin/bash

: '
uninstall the aws cli binaries
'

AWS_BINARIES=("/usr/local/bin/aws" "/usr/local/bin/aws_completer")
AWS_CLI_FOLDER="/usr/local/aws-cli"

echoinfo "Uninstalling aws cli"

for FILE in "${AWS_BINARIES[@]}"; do
    if [[ -f $FILE ]]; then
        echoinfo "Found $FILE, removing"
        rm "$FILE"
        echoinfo "Finished removing $FILE"
    else
        echoinfo "$FILE not found"
    fi
done

if [[ -d $AWS_CLI_FOLDER ]]; then
    echoinfo "Found $AWS_CLI_FOLDER, removing"
    rm $AWS_CLI_FOLDER -rf
    echoinfo "finished removing $AWS_CLI_FOLDER"
fi

echoinfo "Finished installing aws cli"
