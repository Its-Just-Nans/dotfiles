#!/bin/bash


grey=$(tput setaf 244)
blue=$(tput setaf 4)
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)

deploy() {
    # https://stackoverflow.com/a/4774063
    SCRIPT_PATH="$(
        cd -- "$(dirname "$0")" >/dev/null 2>&1 || return
        pwd -P
    )/"

    scripts=$(fdfind -H -a -E .git -t f --full-path "./\..*")


    for one_script in $scripts; do
        local_path=${one_script//$SCRIPT_PATH/}
        dest_path="$HOME/$local_path"
        dir_path=$(dirname "$dest_path")
        if [ ! -d "$dir_path" ]; then
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
}

save(){
    echo "Syncing files..."
    # sync-gnome
    dconf dump /org/gnome/terminal/ > gterminal.preferences
    # sync-cargo
    cargo install --list | grep -E '^[a-zA-Z0-9_-]+ v' | awk '{print $1}' > cargo.txt
}

install() {
    echo "shellcheck byobu tmux screen cmatrix thunar wireshark ffmpeg qemu-system libvirt-daemon-system virt-manager"
}

main() {
    if [ $# -eq 0 ]; then
        deploy
    elif [ "$1" = "save" ]; then
        save
    elif [ "$1" = "install" ]; then
        install
    fi
}

main "$@"
