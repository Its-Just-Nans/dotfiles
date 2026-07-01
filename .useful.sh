#!/bin/bash

# useful.sh - A collection of useful shell functions and aliases
# http://github.com/Its-Just-Nans/dotfiles
# update with
# curl -O https://raw.githubusercontent.com/Its-Just-Nans/dotfiles/refs/heads/main/.useful.sh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zig
export ZIG_FOLDER="$HOME/.zig"
export PATH="$ZIG_FOLDER:$PATH"

# nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export PATH="$HOME/.cargo/bin:$HOME/.arduino:$HOME/.local/bin:$PATH"

# go
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

# gradle
#export PATH="$PATH:/opt/gradle/bin/"

if [ -f "/opt/nvim-linux-x86_64/bin/nvim" ]; then
    export EDITOR="/opt/nvim-linux-x86_64/bin/nvim"
    # shellcheck disable=SC2139
    alias code="$EDITOR"
fi

_is_fd=false
if command -v fd &>/dev/null && command -v fd-find &>/dev/null; then
    # all good
    _is_fd=true
elif command -v fd-find &>/dev/null; then
    alias fd="fd-find"
    _is_fd=true
elif command -v fd &>/dev/null; then
    alias fd-find="fd"
    _is_fd=true
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # if file exists
    if [ -f "$HOME/.cargo/env" ]; then
        # shellcheck disable=SC1091
        source "$HOME/.cargo/env"
    fi

    # git completion __git_ps1
    # curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > .git-prompt.sh
    if [ -f "$HOME/.git-prompt.sh" ]; then
        # shellcheck disable=SC1091
        source "$HOME/.git-prompt.sh"
    fi

    # just --completions bash > .justfile_completion.sh
    if [ -f "$HOME/.justfile_completion.sh" ]; then
        # shellcheck disable=SC1091
        source "$HOME/.justfile_completion.sh"
    fi

    if [ -f "$HOME/.bun/completion.sh" ]; then
        # shellcheck disable=SC1091
        source "$HOME/.bun/completion.sh"
    fi

    # zoxide
    if command -v zoxide &>/dev/null; then
        eval "$(zoxide init bash)"
    fi

    # fzf
    if command -v fzf &>/dev/null; then
        FZF_CTRL_R_COMMAND='' FZF_ALT_C_COMMAND='' eval "$(fzf --bash)"
    fi

    # n4n5
    _completion_n4n5="$HOME/.config/.n4n5/completions/n4n5.bash"
    if [ -f "$_completion_n4n5" ]; then
        # shellcheck disable=SC1090
        . "$_completion_n4n5"
    fi
fi

# to list aliases do 'alias'
# long - all - human size - sort natural - append indicator
alias l='ls -lahvF'
alias ll='l'
alias la='l'
alias ll="l"
alias lla="l"

alias sl="sl | lolcat"
alias p="python"
alias j="just"
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."

alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias nv="nvim"
alias neovim="nvim"

alias n4N5='n4n5'
alias N4n5='n4n5'
alias N4N5='n4n5'
alias n='n4n5'

# android stuff
export ANDROID_SDK_ROOT="$HOME/.android/sdk"
export SDKMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"
export ANDROID_NDK_HOME="$HOME/.android/sdk/ndk/"
export ANDROID_HOME="$HOME/.android/sdk/"

# shellcheck disable=SC2016
_PS1_CHROOT='${debian_chroot:+($debian_chroot)}'
_PS1_USER="\[\033[01;32m\]\u\[\033[00m\]"
if [ "$(hostname)" = "container" ]; then
    _PS1_HOST="\[\033[01;31m\]\h\[\033[00m\]"
else
    _PS1_HOST="\[\033[01;32m\]\h\[\033[00m\]"
fi
_PS1_DIR="\[\033[01;34m\]\w\[\033[00m\]"

export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

if [ -f "$HOME/.git-prompt.sh" ]; then
    _PS1_GIT="\[\033[01;33m\]\$(__git_ps1 '(%s%u)')\[\033[00m\]"
else
    _PS1_GIT="\[\033[01;33m\]()\[\033[00m\]"
fi
PS1="$_PS1_CHROOT$_PS1_USER@$_PS1_HOST:$_PS1_DIR$_PS1_GIT\$ "

startAgent() {
    eval "$(ssh-agent -s)"
}

SSH_ENV="$HOME/.ssh/agent-environment"

server() {
    if ! command -v python &>/dev/null; then
        echo "This program requires python but it's not installed. Aborting." >&2
        return 1
    fi
    python -m http.server
}

phpserver() {
    if ! command -v php &>/dev/null; then
        echo "This program requires php but it's not installed. Aborting." >&2
        return 1
    fi
    php -S localhost:8000
}

removeExtension() {
    echo "${1%.*}"
}

compressPDF() {
    if ! command -v gs &>/dev/null; then
        echo "This program requires gs but it's not installed. Aborting." >&2
        return 1
    fi

    name=$(removeExtension "$1")
    if [ "$#" -ne 2 ]; then
        echo "Usage compressPDF <file_name> <num_resolution>"
        return
    fi
    if ! test -f "$1"; then
        echo "'$1' No such file"
        return
    fi
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true -dColorImageResolution="$2" -dNOPAUSE -dBATCH -sOutputFile="${name}_compressed.pdf" "$1"
}

nvm() {
    # nvm <https://github.com/nvm-sh/nvm>
    # nvm is really slow to source (0.3 sec) so we lazy load it
    if [ -d "$HOME/.nvm" ]; then
        export NVM_DIR="$HOME/.nvm"
        # shellcheck disable=SC1091
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
        # shellcheck disable=SC1091
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
        if [ $# -eq 0 ]; then
            echo "No arguments provided. nvm is now loaded. You can try"
            echo "nvm install node"
            echo "nvm use node"
        else
            nvm "$@"
        fi
    else
        echo "nvm seems not installed - $HOME/.nvm does not exists. Check https://github.com/nvm-sh/nvm"
        return 1
    fi
}


whileLoop() {
    echo "while true; do action; sleep 2; done"
}

dock() {
    if ! command -v docker &>/dev/null; then
        echo "This program requires docker but it's not installed. Aborting." >&2
        return 1
    fi

    echo "docker run -it debian /bin/bash"
    docker pull debian
    docker run -it debian /bin/bash
}

# go to github directories
g() {
    use_editor=false
    folder=""
    for oneArg in "$@"; do
        if [ "$oneArg" = "-c" ]; then
            use_editor=true
        elif [ "$folder" = "" ]; then
            folder=$oneArg
        fi
    done
    if [ ! -d "${HOME}/Documents/github/" ]; then
        mkdir -p "${HOME}/Documents/github/"
        echo "Folder ${HOME}/Documents/github/ created"
    fi

    if [ ! -d "${HOME}/Documents/github/${folder}" ]; then
        echo "Folder ${HOME}/Documents/github/${folder} does not exists"
        return 1
    fi
    if [ -z "$folder" ] && [ "$(pwd)" == "${HOME}/Documents/github" ]; then
        listGIT
        return 0
    else
        cd "${HOME}/Documents/github/${folder}" || return 1
    fi
    # check if onefetch is installed
    if [ "$folder" != "" ]; then
        if command -v onefetch &>/dev/null; then
            onefetch .
        else
            echo "onefetch not installed :("
        fi
    fi
    if [ "$use_editor" = true ]; then
        if command -v "$EDITOR" &>/dev/null; then
            "$EDITOR" .
        else
            echo "$EDITOR is not installed :("
        fi
    fi
}

# an opinionated g command
gc() {
    g "$@" -c
}

# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -d "$HOME/Documents/github" ]; then
        _g_options=$(ls -1 "$HOME/Documents/github")
        complete -W "${_g_options}" 'g'
        complete -W "${_g_options}" 'gc'
    fi
fi

# shellcheck disable=SC2120
mkt() {
    custom_tmp="$HOME/tmp/"
    mkdir -p "$custom_tmp"
    cd "$custom_tmp" || return
    if [ "$1" ]; then
        filename=$(basename -- "$1")
        repo_name="${filename%.*}"
        random="$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)"
        # if folder exists
        if [ -d "$repo_name" ]; then
            repo_name="${repo_name}_${random}"
        fi
        if git clone "$1" "$repo_name"; then
            cd "$repo_name" || return
            if command -v "$EDITOR" &>/dev/null; then
                "$EDITOR" .
            else
                echo "mkt(): $EDITOR not installed :("
            fi
        else
            echo "mkt(): Error during the clone"
        fi
    else
        folder=$(mktemp -d -p "$custom_tmp")
        cd "$folder" || return
    fi
}

gsize() {
    git gc && git count-objects -vH
}

myip() {
    curl ifconfig.me "$@"
    echo ""
}

q() {
    if ! command -v fortune &>/dev/null; then
        echo "This program requires fortune but it's not installed. Aborting." >&2
        return 1
    fi
    if ! command -v cowsay &>/dev/null; then
        echo "This program requires cowsay but it's not installed. Aborting." >&2
        return 1
    fi
    if ! command -v fd &>/dev/null; then
        echo "This program requires fd but it's not installed. Aborting." >&2
        return 1
    fi
    if ! command -v shuf &>/dev/null; then
        echo "This program requires shuf but it's not installed. Aborting." >&2
        return 1
    fi
    if ! command -v lolcat &>/dev/null; then
        echo "This program requires lolcat but it's not installed. Aborting." >&2
        return 1
    fi

    clear
    echo "Have a beautiful day" | cowsay -f "$(fd . /usr/share/cowsay/cows/ --exec basename {} | shuf -n1)" | lolcat
}


ai2svg() {
    if ! command -v inkscape &>/dev/null; then
        echo "This program requires inkscape but it's not installed. Aborting." >&2
        return 1
    fi

    path=""
    for oneArg in "$@"; do
        if [ "$oneArg" = "-p" ]; then
            path="_path"
        fi
    done
    for oneArg in "$@"; do
        if [ "$oneArg" != "-p" ]; then
            output=${oneArg//.ai/$path.svg}
            if ! test -f "$oneArg"; then
                echo "'$oneArg' No such file"
                continue
            fi
            if [ "$path" != "" ]; then
                inkscape "$oneArg" --export-area-drawing "--export-plain-svg=$output" --export-text-to-path
            else
                inkscape "$oneArg" --export-area-drawing "--export-plain-svg=$output"
            fi
        fi
    done
}

ff() {
    if ! command -v ffmpeg &>/dev/null; then
        echo "This program requires ffmpeg but it's not installed. Aborting." >&2
        return 1
    fi

    if [ "$1" == "" ]; then
        echo "Usage: ff LINE"
        return
    fi
    name=$(removeExtension "$1")
    ffmpeg -i "$1" -preset veryslow "${name}.mkv"
    echo "Old : $1"
    echo "New : ${name}.mkv"
}

toFlac() {
    for oneFile in "$@"; do
        noExt=$(removeExtension "$oneFile")
        ffmpeg -i "${oneFile}" -c:a flac "${noExt}.flac"
    done
}

yt() {
    yt-dlp "$@"
}

img2text() {
    for oneFile in "$@"; do
        cuneiform -o "${oneFile}.txt" "${oneFile}"
    done
}

dos2unixR() {
    list=$(ls -1)
    for oneFile in $list; do
        if [[ -f $oneFile ]] && [ "$oneFile" != ".git" ]; then
            dos2unix ./*
        else
            cd "$oneFile" || return
            dos2unixR
            cd ..
        fi
    done
}

cleanLatex() {
    toDelete=""
    toDelete="${toDelete} $1.aux"
    toDelete="${toDelete} $1.out"
    toDelete="${toDelete} $1.bbl"
    toDelete="${toDelete} $1.bbl"
    toDelete="${toDelete} $1.blg"
    toDelete="${toDelete} $1.lof"
    toDelete="${toDelete} $1.log"
    toDelete="${toDelete} $1.toc"
    toDelete="${toDelete} $1.nav"
    toDelete="${toDelete} $1.lot"
    toDelete="${toDelete} $1.ist"
    toDelete="${toDelete} $1.glo"
    toDelete="${toDelete} $1.bcf"
    toDelete="${toDelete} $1.acn"
    toDelete="${toDelete} $1.snm"
    toDelete="${toDelete} $1.nlo"
    toDelete="${toDelete} texput.log"
    toDelete="${toDelete} _minted-$1"
    for oneElement in ${toDelete}; do
        echo "Deleting ${oneElement}"
        if [ -f "${oneElement}" ]; then
            echo "Deleting ${oneElement}"
            rm "${oneElement}"
        elif [ -d "${oneElement}" ]; then
            rm -r "${oneElement}"
        fi
    done
}

dolatex() {
    runEvince=true
    clean=true
    binary="lualatex"
    once=false
    for oneArg in "$@"; do
        if [ "$oneArg" = "-xe" ]; then
            binary="xelatex"
        elif [ "$oneArg" = "--no-clean" ]; then
            clean=false
        elif [ "$oneArg" = "-1" ]; then
            once=true
        elif [ "$oneArg" = "-s" ] || [ "$oneArg" = "-q" ] || [ "$oneArg" = "--no-show" ]; then
            runEvince=false
        else
            name="$oneArg"
        fi
    done
    if [ ! -f "$name" ]; then
        echo "File not found!"
        return
    fi
    nameNoExtension=$(removeExtension "${name}")
    outputName="${nameNoExtension}.pdf"
    echo "name of file : ${nameNoExtension}"
    $binary -shell-escape "${name}"
    echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    if [ -f "${outputName}" ]; then
        bibtex "${nameNoExtension}.aux"
    fi
    if [ "$once" = false ]; then
        $binary -shell-escape "${name}"
        $binary -shell-escape "${name}"
    fi
    echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    if [ "$clean" = true ]; then
        cleanLatex "$nameNoExtension"
    fi
    if [ "$runEvince" = true ]; then
        if [ -f "${outputName}" ]; then
            evince "${outputName}"
        else
            echo "Error during the creation of ${outputName}"
        fi
    fi
}

eraseCache() {
    luaotfload-tool --cache=erase
}

# run the same command with sudo to know the PIDs
showPORTS() {
    set -x
    ss -tulpn | grep LISTEN
    set +x
}

compressIMG() {
    if ! command -v convert &>/dev/null; then
        echo "This program requires convert but it's not installed. Aborting." >&2
        return 1
    fi

    if [ "$#" -ne 3 ]; then
        echo "Usage compressIMG <input> <qual> <output>"
        return
    fi
    convert -quality "$2%" "$1" "$3"
}

compressIMG2() {
    set -x
    mozjpeg -quality 90 -outfile "$1.temp" "$1" && rm "$1" && mv "$1.temp" "$1"
    set +x
}

hacker_screen() {
    if ! command -v hollywood &>/dev/null; then
        echo "This program requires hollywood but it's not installed. Aborting." >&2
        return 1
    fi

    hollywood
}

phpmyadmin() {
    if ! command -v php &>/dev/null; then
        echo "This program requires php but it's not installed. Aborting." >&2
        return 1
    fi

    cd /usr/share/phpmyadmin/ || return
    php -S localhost:8090
}

addPrefix() {
    echo "adding prefix '$1'"
    for file in *; do
        echo "$file -> $1_$file"
        mv -- "$file" "$1_$file"
    done
}

str2pdf() {
    if ! command -v enscript &>/dev/null; then
        echo "This program requires enscript but it's not installed. Aborting." >&2
        return 1
    fi
    if ! command -v ps2pdf &>/dev/null; then
        echo "This program requires ps2pdf but it's not installed. Aborting." >&2
        return 1
    fi

    mkt
    enscript -q -p temp.ps <<<"$1"
    ps2pdf temp.ps temp.pdf
    echo "$(pwd)/temp.pdf"
}

listGIT() {
    list=$(ls -1)
    show_onefetch=false
    quiet=false
    recursive=false
    run_git_fetch=false
    for oneArg in "$@"; do
        if [ "$oneArg" = "-a" ]; then
            show_onefetch=true
        elif [ "$oneArg" = "-q" ]; then
            quiet=true
        elif [ "$oneArg" = "-r" ]; then
            recursive=true
        elif [ "$oneArg" = "-f" ]; then
            run_git_fetch=true
        fi
    done
    COLOR_NC="\033[0m"
    COLOR_BACK_GREEN="\033[42m"
    COLOR_BACK_RED="\033[41m"
    COLOR_BACK_BLUE="\033[44m"
    for x in $list; do

        if [ -d "$x" ]; then
            if [ -d "$x/.git" ]; then
                if [ "$run_git_fetch" = true ]; then
                    git --git-dir="$x/.git" fetch
                fi
                count=$(git --work-tree="$x" --git-dir="$x/.git" status --porcelain | wc -l)
                current=$(git --git-dir="$x/.git" branch --show-current)
                count2=$(git --git-dir="$x/.git" log "origin/$current..HEAD" | wc -l)
                if [ "$show_onefetch" = true ]; then
                    onefetch "$x" || echo "no language detected in $x"
                fi
                if [ "$count" != "0" ] || [ "$count2" != "0" ]; then
                    echo -e "${COLOR_NC}${COLOR_BACK_BLUE}******************$x*********************"
                    git --work-tree="$x" --git-dir="$x/.git" status --porcelain
                    git --git-dir="$x/.git" log "origin/$current..HEAD"
                    echo -e "${COLOR_NC}"
                else
                    if [ "$quiet" = false ]; then
                        echo -e "${COLOR_NC}${COLOR_BACK_GREEN}'$x' is good${COLOR_NC}"
                    fi
                fi
            else
                echo -e "${COLOR_NC}${COLOR_BACK_RED}'$x' is not repo${COLOR_NC}"
            fi
            if [ "$recursive" = true ]; then
                (
                    cd "$x" && listGIT "" && cd ..
                )
                echo "------------"
            fi
        fi
    done
}

reloadNotesBackground() {
    TEXT=$(nl -w1 -s' | ' <"$HOME/.local/share/backgrounds/notes.txt")
    BACKGROUND_SAVE="$HOME/.local/share/backgrounds/background_save.png"
    BACKGROUND="$HOME/.local/share/backgrounds/2022-05-15-16-41-55-background.png"
    convert -font helvetica -fill blue -pointsize 15 -draw "text 5,50 '$TEXT'" "$BACKGROUND_SAVE" "$BACKGROUND"
}

na() {
    if [ "$1" == "" ]; then
        echo "Usage: na TEXT"
        return
    fi
    echo "$1" >>~/.local/share/backgrounds/notes.txt
    reloadNotesBackground
}

nd() {
    if [ "$1" == "" ]; then
        echo "Usage: nd LINE"
        return
    fi
    cp ~/.local/share/backgrounds/notes.txt ~/.local/share/backgrounds/notes.save.txt
    sed -i "${1}d" ~/.local/share/backgrounds/notes.txt
    echo "New file :"
    cat ~/.local/share/backgrounds/notes.txt
    reloadNotesBackground
}

makegif() {
    # if num args < 2
    if [ "$#" -lt 2 ]; then
        echo "Usage makegif <input> <output> [fps] [scale]"
        return
    fi

    fps="30"
    if [ "$3" ]; then
        fps="$3"
    fi

    scale="1280"
    if [ "$4" ]; then
        scale="$4"
    fi
    set -x
    ffmpeg -i "$1" -vf "fps=$fps,scale=$scale:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 "$2"
    set +x
}

start_agent() {
    green=$(tput setaf 2)
    reset=$(tput sgr0)
    echo -n "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
    echo "${green}succeeded${reset}"
    # shellcheck disable=SC2139
    chmod 600 "${SSH_ENV}"
    # shellcheck disable=SC1090
    . "${SSH_ENV}" >/dev/null
    /usr/bin/ssh-add
}

addkeys() {
    should_push=false
    search=""
    for arg in "$@"; do
        if [ "$arg" = "p" ]; then
            should_push=true
        else
            search="$arg"
        fi
    done
    if [[ "$SSH_AUTH_SOCK" == *gpg-agent* ]]; then
        echo "GPG agent detected. Killing it..."
        gpgconf --kill gpg-agent
        unset SSH_AUTH_SOCK
    fi
    r=$(tput setaf 1)
    g=$(tput setaf 2)
    rs=$(tput sgr0)
    if [ -z "$SSH_AGENT_PID" ]; then
        if [ -f "${SSH_ENV}" ]; then
            # shellcheck disable=SC1090
            . "${SSH_ENV}" >/dev/null
            # shellcheck disable=SC2009
            if ps -ef | grep "${SSH_AGENT_PID}" | grep 'ssh-agent$' >/dev/null; then
                echo "ssh-agent is already ${g}running${rs} and is now ${g}loaded${rs}"
                ssh-add -l
                if [ "$should_push" = "true" ]; then
                    echo "git push"
                    git push
                fi
                # return early
                return
            else
                echo "ssh-agent is ${r}not running${rs}, ${g}starting${rs} a new agent"
                start_agent
            fi
        else
            echo "ssh-agent is already ${g}running${rs} but $SSH_ENV does not exists, starting a new agent"
            start_agent
        fi
    else
        # shellcheck disable=SC2009
        if ps -ef | grep "${SSH_AGENT_PID}" | grep 'ssh-agent$' >/dev/null; then
            echo "ssh-agent is already ${g}running${rs} and already ${g}loaded${rs}"
            ssh-add -l
        else
            echo "Agent PID present but not found, starting a new agent"
            start_agent
        fi
    fi
    if [ "$should_push" = "true" ]; then
        echo "git push"
        git push
        return
    fi
    if [ "$search" ]; then
        toSearch="${search}*"
    else
        toSearch="$HOME/.ssh/"
    fi
    list=$(fd "$toSearch" --full-path "$HOME/.ssh/" -t f -E "*.pub" -E 'agent-environment' -E 'known_hosts*' -E 'config')
    for oneFile in $list; do
        ssh-add "${oneFile}"
    done
}

if [ "$_is_fd" == "true" ]; then
    if [ -n "$BASH_VERSION" ]; then
        _addkeys_options=$(fd . "$HOME/.ssh/" -t f --format '{/}' -E "*.pub" -E 'agent-environment' -E 'known_hosts*' -E 'config')
        complete -W "${_addkeys_options}" 'addkeys'
    fi
fi


mkd() {
    mkdir "$1" && cd "$1" || return
}

publish() {
    set -ux
    cargo check --workspace --all-targets
    cargo check --workspace --all-features --lib --target wasm32-unknown-unknown
    cargo fmt --all -- --check
    cargo clippy --workspace --all-targets --all-features --  -D warnings -W clippy::all
    cargo test --workspace --all-targets --all-features
    cargo test --workspace --doc
    trunk build
    cargo publish
    set +ux
}

# https://junegunn.github.io/fzf/tips/ripgrep-integration/
# ripgrep->fzf->vim [QUERY]
rfv() (
    RELOAD='reload:rg --column --color=always --smart-case {q} || :'
    # shellcheck disable=SC2016
    OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
    nvim {1} +{2}     # No selection. Open the current line in Vim.
    else
    nvim +cw -q {+f}  # Build quickfix list for the selected items.
    fi'
    fzf --disabled --ansi --multi \
    --bind "start:$RELOAD" --bind "change:$RELOAD" \
    --bind "enter:become:$OPENER" \
    --bind "ctrl-o:execute:$OPENER" \
    --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
    --delimiter : \
    --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
    --preview-window '~4,+{2}+4/3,<80(up)' \
    --query "$*"
)

copyfile() {
    if [ -z "$1" ]; then
        echo "No argument provided"
    fi
    xclip -selection clipboard < "$1"
}

changeCommitDate() {
    VARIABLE="${1:-3}"
    MESSAGE="${2:-message}"
    # shellcheck disable=SC2016
    printf 'DAT=$(date --date "%s days ago" -R) GIT_AUTHOR_DATE=$DAT GIT_COMMITTER_DATE=$DAT git commit -m "%s"\n' "$VARIABLE" "$MESSAGE"
}

golb() {
    g golb
    cd Its-Just-Nans/golb-articles/ || { echo "Cannot cd to gold"; exit 1; }
    yazi
}

r() {
    clear
    nightly=false
    build=false
    run=false
    test=false
    all=false
    web=false

    run_args=()

    for arg in "$@"; do
        if [ "$arg" = "n" ]; then
            nightly=true
        elif [ "$arg" = "b" ]; then
            build=true
        elif [ "$arg" = "r" ]; then
            run=true
        elif [ "$arg" = "a" ]; then
            all=true
        elif [ "$arg" = "t" ]; then
            test=true
        elif [ "$arg" = "w" ]; then
            web=true
        else
            run_args+=("$arg")
        fi
    done
    cargo clippy
    cargo fmt
    if [ "$all" = "true" ]; then
        cargo clippy --all-targets --all-features
    fi
    if [ "$build" = "true" ]; then
        cargo build
    fi
    if [ "$nightly" = "true" ]; then
        cargo +nightly clippy
        cargo +nightly fmt
        if [ "$build" = "true" ]; then
            cargo +nightly build
        fi
    fi
    if [ "$test" = "true" ]; then
        cargo test
        if [ "$all" = "true" ]; then
            cargo test --all-targets --all-features
        fi
    fi
    if [ "$web" = "true" ]; then
        trunk build
        if [ "$all" = "true" ]; then
            trunk build --all-features
        fi
    fi
    if [ "$run" = "true" ]; then
        cargo run -- "${run_args[@]}"
    fi
}

battery() {
    sudo tlp-stat --battery
}

# open overwrite
open() {
    for f in "$@"; do
        case "$f" in
            *.pdf) evince "$f" & ;;
            *.png|*.jpg|*.jpeg|*.gif|*.webp|*.HEIC) ristretto "$f" & ;;
            *.mp4|*.mkv|*.webm|*.mov)
                mpv "$f" &
                ;;
            *.mp3|*.flac|*.wav|*.ogg)
                mpv "$f" &
                ;;
            # Fonts
            *.ttf|*.otf|*.woff|*.woff2) fontforge "$f" & ;;
            *.sqlite|*.db) sqlitebrowser "$f" & ;;
            *.stl) meshlab "$f" ;;
            *.xcf) gimp "$f" & ;;
            *.svg) galago "$f" & ;;
            *)     vi "$f" ;;
        esac
    done
}

mou() {
    root="${1:-/}"
    while read -r src target fstype _ _; do
        [[ $src != /* ]] && continue
        [[ $target == /snap || $target == /snap/* ]] && continue
        [[ $target == /boot/* ]] && continue
        # Hide root and anything below it
        [[ $target == "$root" || $target == "$root"/* ]] && continue

        printf "%s %s %s\n" "$src" "$target" "$fstype"
    done < /proc/mounts

}


setup_setup() {
    if ! command -v fd &>/dev/null; then
        echo "${red}fd is not installed${reset}"
        echo "cargo install fd-find"
        return 1
    fi

    scripts=$(fd -H -a -E .git -t f --full-path "./\..*")

    for one_script in $scripts; do
        local_path=${one_script#"$SCRIPT_PATH"/}
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

    wallpaper="background.png"
    cp "$wallpaper" "/opt/$wallpaper"
    if command -v gsettings &>/dev/null; then
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

    if command -v n4n5 &>/dev/null; then
        echo -n "Setting up '${grey}n4n5 completions${reset}'..."
        n4n5 completions
        sleep "$sleep_time"
        echo "${green}done${reset}"
    else
        echo "${red}n4n5 is not installed${reset}"
    fi
}

setup_save(){
    echo "Syncing files..."
    # sync-gnome
    dconf dump /org/gnome/terminal/ > gterminal.preferences
    # sync-cargo
    cargo install --list | grep -E '^[a-zA-Z0-9_-]+ v' | awk '{print $1}' > cargo.txt

    # nix-env --query | cut -d'-' -f 1
    # code --list-extensions

    dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > media-keys.txt
}


setup_install() {
    echo "git-crypt shellcheck thunar flameshot\
 imagemagick libimage-exiftool-perl gimp inkscape\
 byobu tmux screen\
 wireshark ffmpeg\
 libaa-bin cmatrix\
 qemu-system libvirt-daemon-system virt-manager"
}

setup_check() {
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

setup_meta() {
    if ! command -v shellcheck &>/dev/null; then
        echo "shellcheck is not installed"
    else
        shellcheck .useful.sh
    fi
}

setup_add() {
    dir=$(dirname "$1")
    if [[ "$dir" == $HOME/* ]]; then
        dir="${dir#"$HOME"/}"
    else
        echo "$1 does not start with $HOME"
        return 1
    fi
    if [ ! -f "$dir" ];then
        echo "Creating $dir"
        mkdir -p "$dir"
    fi
    file=$(basename "$1")
    echo "Copying $1 to $dir/$file"
    cp "$1" "$dir/$file"

    ln -s -f "$SCRIPT_PATH/$dir/$file" "$1"
}


setup() {
    if [ $# -eq 0 ]; then
        echo "please specify argument: setup, save, check, install, meta, add"
        return 1
    fi

    current_pwd="$(pwd)"
    dotfiles_path="$HOME/Documents/github/dotfiles/"
    if [ -d "$dotfiles_path" ]; then
        cd "$dotfiles_path" || { echo "Failed to cd to $dotfiles_path"; exit 1; }
    else
        echo "Folder $dotfiles_path does not exist"
        exit 1
    fi

    grey=$(tput setaf 244)
    blue=$(tput setaf 4)
    green=$(tput setaf 2)
    red=$(tput setaf 1)
    reset=$(tput sgr0)
    sleep_time="0.08"

    # https://stackoverflow.com/a/4774063
    SCRIPT_PATH="$(
        cd -- "$(dirname "$0")" >/dev/null 2>&1 || return
        pwd -P
    )"



    case "$1" in
        setup)   setup_setup ;;
        save)    setup_save ;;
        check)   setup_check ;;
        install) setup_install ;;
        meta)    setup_meta ;;
        add)
            [ -z "$2" ] && { echo "add requires an argument"; exit 1; }
            setup_add "$2"
            ;;
        *)       echo "no arg $1" ;;
    esac

    cd "$current_pwd" || { echo "Failed to cd to $dotfiles_path"; exit 1; }
}

if [ -n "$BASH_VERSION" ]; then
    _setup_options="setup save check install meta add"
    complete -W "${_setup_options}" 'setup'
fi


# The line beneath this is called `modeline`. See `:help modeline`
# vim: ts=4 sts=4 sw=4 et

