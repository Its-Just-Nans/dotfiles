#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_PATH="$(
    cd -- "$(dirname "$0")" >/dev/null 2>&1 || return
    pwd -P
)/"

scripts=$(fdfind -H -a -E .git -t f --full-path "./\..*")

grey=$(tput setaf 244)
blue=$(tput setaf 4)
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)

for one_script in $scripts; do
    local_path=${one_script//$SCRIPT_PATH/}
    dest_path="$HOME/$local_path"
    dir_path=$(dirname "$dest_path")
    if [ ! -d $dir_path ]; then
        echo "Creating '${blue}$dir_path${reset}'"
	mkdir -p "$dir_path"
    fi
    echo -n "Installing '${grey}$local_path${reset}' at '${blue}$dest_path${reset}'..."
    ln -s -f "$one_script" "$dest_path"
    result=$?
    sleep 0.1
    if [ "$result" -eq 0 ]; then
        echo "${green}done${reset}"
    else
        echo "${red}failed${reset}"
    fi
done
