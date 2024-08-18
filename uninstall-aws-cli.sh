#!/bin/bash

: '
uninstall the aws cli binaries
'

AWS_BINARIES=("/usr/local/bin/aws" "/usr/local/bin/aws_completer")
AWS_CLI_FOLDER="/usr/local/aws-cli"

echo "INFO: uninstalling aws cli"

for FILE in "${AWS_BINARIES[@]}"; do
    if [[ -f $FILE ]]; then
        echo "INFO: found $FILE, removing"
        rm "$FILE"
        echo "INFO: finished removing $FILE"
    else
        echo "INFO: $FILE not found"
    fi
done

if [[ -d $AWS_CLI_FOLDER ]]; then
    echo "INFO: found $AWS_CLI_FOLDER, removing"
    rm $AWS_CLI_FOLDER -rf
    echo "INFO: finished removing $AWS_CLI_FOLDER"
fi

echo "INFO: finished installing aws cli"
