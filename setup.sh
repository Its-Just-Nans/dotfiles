#!/bin/bash


grey=$(tput setaf 244)
blue=$(tput setaf 4)
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)
sleep_time="0.08"

setup() {
    if ! command -v fd &>/dev/null; then
        echo "${red}fd is not installed${reset}"
        echo "cargo install fd-find"
        return 1
    fi
    # https://stackoverflow.com/a/4774063
    SCRIPT_PATH="$(
        cd -- "$(dirname "$0")" >/dev/null 2>&1 || return
        pwd -P
    )/"

    scripts=$(fd -H -a -E .git -t f --full-path "./\..*")

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
        sleep "$sleep_time"
        if [ "$result" -eq 0 ]; then
            echo "${green}done${reset}"
        else
            echo "${red}failed${reset}"
        fi
    done

    if command -v dconf &>/dev/null; then
        echo -n "Setting up '${grey}gterminal.preferences${reset}'..."
        dconf reset -f /org/gnome/terminal/
        dconf load /org/gnome/terminal/ < gterminal.preferences
        sleep "$sleep_time"
        echo "${green}done${reset}"
    else
        echo "${red}dconf is not installed${reset}"
    fi

    if command -v gsettings &>/dev/null; then
        wallpaper="background.png"
        if [ -f "$wallpaper" ]; then
                current_path=$(pwd)
                path_wallpaper="$current_path/$wallpaper"
                echo -n "Setting up '${grey}$path_wallpaper${reset}'..."
                gsettings set org.gnome.desktop.background picture-uri "$path_wallpaper"
                gsettings set org.gnome.desktop.background picture-uri-dark "$path_wallpaper"
                sleep "$sleep_time"
                echo "${green}done${reset}"
         else
                echo "${red}No such file '$wallpaper'${reset}"
         fi
    else
        echo "${red}gsettings is not installed${reset}"
    fi

    if command -v dconf &>/dev/null; then
        echo -n "Setting up '${grey}shortcuts${reset}'..."
        dconf reset -f /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/
        dconf reset /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings
        dconf load /org/gnome/settings-daemon/plugins/media-keys/ < media-keys.txt
        sleep "$sleep_time"
        echo "${green}done${reset}"
    else
        echo "${red}dconf is not installed${reset}"
    fi

    if command -v rustup &>/dev/null; then
        echo -n "Setting up '${grey}rust completions${reset}'..."
        mkdir -p ~/.local/share/bash-completion/completions
        rustup completions bash       > ~/.local/share/bash-completion/completions/rustup
        rustup completions bash cargo > ~/.local/share/bash-completion/completions/cargo
        sleep "$sleep_time"
        echo "${green}done${reset}"
    else
        echo "${red}rustup is not installed${reset}"
    fi
}

save(){
    echo "Syncing files..."
    # sync-gnome
    dconf dump /org/gnome/terminal/ > gterminal.preferences
    # sync-cargo
    cargo install --list | grep -E '^[a-zA-Z0-9_-]+ v' | awk '{print $1}' > cargo.txt
    dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > media-keys.txt
}

install() {
    echo "git-crypt shellcheck thunar flameshot\
imagemagick libimage-exiftool-perl gimp inkscape \
byobu tmux screen \
wireshark ffmpeg \
libaa-bin cmatrix \
qemu-system libvirt-daemon-system virt-manager"
}


check() {
    spacing='                                      '
    cmd_test="nvim"
    if ! command -v "$cmd_test" &>/dev/null; then
        echo "${red}$cmd_test is not installed${reset}"
        echo "https://neovim.io/doc/install/"
        echo ""
    else
        printf "%s %s ${green}[OK]${reset}\n" "$cmd_test" "${spacing:${#cmd_test}}"
    fi
    sleep "$sleep_time"

    cmd_test="nvm"
    if ! command -v node &>/dev/null || ! command -v npm &>/dev/null; then
        if [ -d "$HOME/.nvm" ]; then
            # nvm seems present but not loaded
            cmd_test="$cmd_test seems installed but not loaed"
            printf "%s %s ${green}[OK]${reset}\n" "$cmd_test" "${spacing:${#cmd_test}}"
        else
            echo "node and/or npm are not installed"
            echo "https://github.com/nvm-sh/nvm/"
        fi
    else
        printf "%s %s ${green}[OK]${reset}\n" "$cmd_test" "${spacing:${#cmd_test}}"
    fi
    sleep "$sleep_time"

    cmd_test="go"
    if ! command -v "$cmd_test" &>/dev/null; then
        echo "${red}$cmd_test is not installed${reset}"
        echo "https://go.dev/doc/install"
        echo ""
    else
        printf "%s %s ${green}[OK]${reset}\n" "$cmd_test" "${spacing:${#cmd_test}}"
    fi
    sleep "$sleep_time"

    cmd_test="lazygit"
    if ! command -v "$cmd_test" &>/dev/null; then
        repo="github.com/jesseduffield/lazygit"
        echo "${red}$cmd_test is not installed${reset}"
        echo "https://$repo"
        echo "go install $repo@latest"
        echo ""
    else
        printf "%s %s ${green}[OK]${reset}\n" "$cmd_test" "${spacing:${#cmd_test}}"
    fi
    sleep "$sleep_time"

    cmd_test="fzf"
    if ! command -v "$cmd_test" &>/dev/null; then
        repo="github.com/junegunn/fzf"
        echo "${red}$cmd_test is not installed${reset}"
        echo "https://$repo"
        echo "go install $repo@latest"
        echo ""
    else
        printf "%s %s ${green}[OK]${reset}\n" "$cmd_test" "${spacing:${#cmd_test}}"
    fi
    sleep "$sleep_time"

    if command -v fc-list &>/dev/null; then
        cmd_test="Font Ubuntu Mono"
        if fc-list | grep "Ubuntu Mono" &> /dev/null; then
            printf "%s %s ${green}[OK]${reset}\n" "$cmd_test" "${spacing:${#cmd_test}}"
        else
            echo "${red}Font Ubuntu Mono is not installed${reset}"
        fi
        sleep "$sleep_time"

        cmd_test="Font CommitMono"
        if fc-list | grep "CommitMono" &> /dev/null; then
            printf "%s %s ${green}[OK]${reset}\n" "$cmd_test" "${spacing:${#cmd_test}}"
        else
            echo "${red}Font CommitMono is not installed${reset}"
        fi
        sleep "$sleep_time"
    else
        echo "${red}fc-list is not installed${reset}"
    fi
}

meta() {
    if ! command -v shellcheck &>/dev/null; then
        echo "shellcheck is not installed"
    else
        shellcheck setup.sh
    fi
}

add() {
    dir=$(dirname "$1")
    if [[ "$dir" == $HOME/* ]]; then
        dir="${dir#"$HOME"/}"
    else
        echo "$1 does not start with $HOME"
        exit 1
    fi
    if [ ! -f "$dir" ];then
        echo "Creating $dir"
        mkdir -p "$dir"
    fi
    file=$(basename "$1")
    echo "Copying $1 to $dir/$file"
    cp "$1" "$dir/$file"
}

main() {
    if [ $# -eq 0 ]; then
        echo "please specify argument"
        exit 1
    fi

    case "$1" in
        setup)   setup ;;
        save)    save ;;
        check)   check ;;
        install) install ;;
        meta)    meta ;;
        add)
            [ -z "$2" ] && { echo "add requires an argument"; exit 1; }
            add "$2"
            ;;
        *)       echo "no arg $1" ;;
    esac
}

main "$@"
