#!/bin/bash

alias ll="ls -lahv"
alias lla="ls -lahv"
alias sl="sl | lolcat"
alias p="python"

check_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "I require $1 but it's not installed.  Aborting." >&2
    exit 1
  fi
}

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
  _g_options=$(ls -1 "$HOME/Documents/github")
  complete -W "${_g_options}" 'g'
  complete -W "${_g_options}" 'gc'
fi

# shellcheck disable=SC2120
mkt() {
  path_folder=$(mktemp -d -p "$HOME/tmp/")
  cd "$path_folder" || return
  if [ "$1" ]; then
    git clone "$1"
    dir=$(ls -1)
    if [ "$dir" ]; then
      if command -v code &>/dev/null; then
        code "$(ls -1)" && exit
      else
        echo "code not installed :("
      fi
    fi
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
  check_command "fdfind"
  check_command "shuf"
  check_command "lolcat"
  clear
  fortune | cowsay -f "$(fdfind . /usr/share/cowsay/cows/ --exec basename {} | shuf -n1)" | lolcat
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
  yt-dlp "$1"
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
  for oneArg in "$@"; do
    if [ "$oneArg" = "-s" ] || [ "$oneArg" = "-q" ] || [ "$oneArg" = "--no-show" ] || [ "$oneArg" = "-xe" ] || [ "$oneArg" = "--no-clean" ]; then
      if [ "$oneArg" = "-xe" ]; then
        binary="xelatex"
      elif [ "$oneArg" = "--no-clean" ]; then
        clean=false
      else
        runEvince=false
      fi
    else
      name="$oneArg"
    fi
  done
  if [ ! -f "$oneArg" ]; then
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
  $binary -shell-escape "${name}"
  $binary -shell-escape "${name}"
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
  for oneArg in "$@"; do
    if [ "$oneArg" = "-a" ]; then
      show_onefetch=true
    fi
    if [ "$oneArg" = "-q" ]; then
      quiet=true
    fi
    if [ "$oneArg" = "-r" ]; then
      recursive=true
    fi
  done
  for x in $list; do

    if [ -d "$x" ]; then
      if [ -d "$x/.git" ]; then
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
