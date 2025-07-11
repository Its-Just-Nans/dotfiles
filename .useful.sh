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

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # if file exists
  if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
  fi
  if [ -f "$HOME/.bun/completion.sh" ]; then
    source "$HOME/.bun/completion.sh"
  fi
  # zoxide
  if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
  fi

  # nvm
  if [ -d "$HOME/.nvm" ]; then

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  fi
fi

export PATH="$HOME/.cargo/bin:$HOME/.arduino:$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

alias ll="ls -lahv"
alias lla="ls -lahv"
alias sl="sl | lolcat"
alias p="python"
alias ..="cd .."
alias ...="cd ../.."

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# android stuff
export ANDROID_SDK_ROOT="$HOME/.android/sdk"
export SDKMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"
export ANDROID_NDK_HOME="$HOME/.android/sdk/ndk/"
export ANDROID_HOME="$HOME/.android/sdk/"

# go
export PATH="$PATH:/usr/local/go/bin"

# gradle
export PATH="$PATH:/opt/gradle/bin/"

# shellcheck disable=SC2016
_PS1_CHROOT='${debian_chroot:+($debian_chroot)}'
_PS1_USER="\[\033[01;32m\]\u\[\033[00m\]"
_PS1_HOST="\[\033[01;32m\]\h\[\033[00m\]"
_PS1_DIR="\[\033[01;34m\]\w\[\033[00m\]"
_PS1_GIT="\[\033[01;33m\]\$(__git_ps1 '(%s)')\[\033[00m\]"
PS1="$_PS1_CHROOT$_PS1_USER@$_PS1_HOST:$_PS1_DIR$_PS1_GIT\$ "

alias n4N5='n4n5'
alias N4n5='n4n5'
alias N4N5='n4n5'
alias n='n4n5'

check_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "I require $1 but it's not installed.  Aborting." >&2
    exit 1
  fi
}

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

startAgent() {
  eval "$(ssh-agent -s)"
}

server() {
  check_command "python"
  python -m http.server
}

phpserver() {
  check_command "php"
  php -S localhost:8000
}

removeExtension() {
  echo "${1%.*}"
}

compressPDF() {
  check_command "gs"
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

whileLoop() {
  echo "while true; do action; sleep 2; done"
}

dock() {
  check_command "docker"
  echo "docker run -it debian /bin/bash"
  docker pull debian
  docker run -it debian /bin/bash
}

# go to github directories
g() {
  code=false
  exitAtEnd=false
  folder=""
  for oneArg in "$@"; do
    if [ "$oneArg" = "-c" ]; then
      code=true
    elif [ "$oneArg" = "-e" ]; then
      exitAtEnd=true
    else
      folder=$oneArg
    fi
  done
  cd "${HOME}/Documents/github/${folder}" || return
  # check if onefetch is installed

  if [ "$folder" != "" ]; then
    if command -v onefetch &>/dev/null; then
      onefetch .
    else
      echo "onefetch not installed :("
    fi
  fi
  if [ "$code" = true ]; then
    if command -v code &>/dev/null; then
      code .
    else
      echo "code not installed :("
    fi
  fi
  # if running bash
  # we exit the terminal
  if [ -n "$BASH_VERSION" ]; then
    if [ "$exitAtEnd" = true ]; then
      exit
    fi
  fi
}

# an opinionated g command
gc() {
  g "$@" -c -e
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
      if command -v code &>/dev/null; then
        code . && exit
      else
        echo "mkt(): code not installed :("
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
  check_command "fortune"
  check_command "cowsay"
  check_command "fd"
  check_command "shuf"
  check_command "lolcat"
  clear
  fortune | cowsay -f "$(fd . /usr/share/cowsay/cows/ --exec basename {} | shuf -n1)" | lolcat
}

ai2svg() {
  check_command "inkscape"
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
  check_command "ffmpeg"
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

showPORTS() {
  ss -tulpn | grep LISTEN
}

export COLOR_BLUE="\033[0;34m"
export COLOR_RED="\033[0;31m"
export COLOR_GREEN="\033[0;32m"
export COLOR_NC="\033[0m"
export COLOR_BACK_WHITE="\033[47m"
export COLOR_BACK_GREEN="\033[42m"
export COLOR_BACK_RED="\033[41m"
export COLOR_BACK_BLUE="\033[44m"

compressIMG() {
  check_command "convert"
  if [ "$#" -ne 3 ]; then
    echo "Usage compressIMG <input> <qual> <output>"
    return
  fi
  convert -quality "$2%" "$1" "$3"
}

compressIMG2() {
  mozjpeg -quality 90 -outfile "$1.temp" "$1" && rm "$1" && mv "$1.temp" "$1"
}

hacker_screen() {
  check_command "hollywood"
  hollywood
}

phpmyadmin() {
  check_command "php"
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
  check_command "enscript"
  check_command "ps2pdf"
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
    echo "Usage: $0 TEXT"
    return
  fi
  echo "$1" >>~/.local/share/backgrounds/notes.txt
  reloadNotesBackground
}

nd() {
  if [ "$1" == "" ]; then
    echo "Usage: $0 LINE"
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

  ffmpeg -i "$1" -vf "fps=$fps,scale=$scale:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 "$2"
}

addkeys() {
  if [ "$1" ]; then
    toSearch="${1}*"
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
