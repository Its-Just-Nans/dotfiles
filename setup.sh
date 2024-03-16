#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_PATH="$(
    cd -- "$(dirname "$0")" >/dev/null 2>&1 || return
    pwd -P
)/"

scripts=$(fdfind -H -a -E .git -t f --full-path "./\..*")

for one_script in $scripts; do
    local_path=${one_script//$SCRIPT_PATH/}
    dest_path="$HOME/$local_path"
    echo -n "Installing '$local_path' at '$dest_path'..."
    ln -s -f "$one_script" "$dest_path"
    sleep 0.1
    echo "done"
done
