#!/bin/bash

: '
uninstall astral environment
'

decorated_uninstall() {
    APPLICATION=$1
    UNINSTALL_METHOD=$2
    echo "INFO: $APPLICATION installation found, uninstalling"
    eval "$UNINSTALL_METHOD"
    echo "INFO: $APPLICATION finished uninstalling"
}

echo "INFO: uninstalling astral environment"

uninstall_uv() {
    UV_LOCATION="$HOME/.cargo/bin/uv"
    UVX_LOCATION="$HOME/.cargo/bin/uvx"
    LOCATIONS=("$UV_LOCATION" "$UVX_LOCATION")

    for APP_LOCATION in "${LOCATIONS[@]}"; do
        if [[ -f "$APP_LOCATION" ]]; then
            echo "INFO: $APP_LOCATION found, removing"
            rm "$APP_LOCATION"
            echo "INFO: finished removing $APP_LOCATION"
        else
            echo "INFO: $APP_LOCATION not found"
        fi

    done

}

decorated_uninstall "rye" "rye uninstall"
decorated_uninstall "uv" "uninstall_uv"
