# dotfiles

dotfiles. It's about ownership.

## Setup

```sh
# install git rustup and fd
git clone https://github.com/Its-Just-Nans/dotfiles.git && cd dotfiles && ./setup.sh setup
```

## Others

```sh
# install deps
apt install pkg-config gcc clang make cmake git curl libssl-dev xclip python-is-python3 python3-pip

# setup SSH key and GPG

apt install $(./setup.sh install)
cargo install $(cat cargo.txt)

# check installed programs
./setup.sh check
```

## Save settings

```sh
./setup.sh save
```

## License

Licensed under MIT License. Note that some file have their own license, for example, the background is made by <https://alphacoders.com/users/profile/113564/Luke100000> with it's own license (free for personal use).

## Others programs

```sh
ghex # hex editor
fortune # quote of life
sl # just a train
libaa-bin # activate a little fire with `aafire`
lolcat # download all ruby just to show rainbow
polybar # to do
https://hannahmontana.sourceforge.net/ # wish I knew this before
https://github.com/pipeseroni/pipes.sh
screen # multiple terminal
tmux # screen but better
byobu # tmux but better
cmatrix # enter now
ffmpeg # bel art!
obs-studio # record your screen
htop # better top
okular # pdf
pdfarranger # love pdf
vlc # if not already present
blender # 3D
dos2unix # convert file
golang # dev with go
default-jdk # java
docker
clamav # virus scanner
lynis # antivirus
nextcloud-desktop # nextcloud desktop client
curl # request
yt-dlp # youtube-dl fork
rclone # https://github.com/rclone/rclone
flac # https://github.com/xiph/flac
dav1d # https://code.videolan.org/videolan/dav1d/
unison # bidirect sync files
unison-gtk # unison but with an interface
keepassxc # keepassx is dead
texlive-full # for latex
xscreensaver # screen saver!
blueman # bluetooth gtk interface
valgrind # detect leak errors
tlp # battery management
calligra # libreoffice alternative
nmap # networking
network-manager-openvpn-gnome openvpn # use openvpn
phpmyadmin # or just clone the git repo!
mediainfo # get info of a media
visidata # https://github.com/saulpw/visidata
gource # git visualization https://github.com/acaudwell/Gource
pipewire # https://www.youtube.com/watch?v=5a7_2mA2LYQ
apt-listchanges
needrestart
testdisk # testdisk and photorec
lmms # music
ardour # music
mixxx # dj
sqlitebrowser # sqlite inspector
ImHex # hex editor https://github.com/WerWolv/ImHex
nvm # https://github.com/nvm-sh/nvm/
arduino-cli # https://github.com/arduino/arduino-cli
sysstat # https://github.com/sysstat/sysstat
czkawka # https://github.com/qarmin/czkawka
matrix  # communication protocol https://www.youtube.com/watch?v=BieAw6lwntU
gifsicle # gif manipulation
puddletag # music tag editor https://github.com/puddletag/puddletag
magic-trace # https://magic-trace.org/
vhs # record terminal https://github.com/charmbracelet/vhs
typst # https://typst.app/
trippy # https://github.com/fujiapple852/trippy
mise # https://github.com/jdx/mise
binocle # https://github.com/sharkdp/binocle
zizmor # Static analysis of GitHub Actions https://github.com/zizmorcore/zizmor
lazygit # https://github.com/jesseduffield/lazygit
sq # sequoia-sq https://gitlab.com/sequoia-pgp/sequoia
rshell # remote shell for MicroPython - https://github.com/dhylands/rshell
flameshot # screenshot https://flameshot.org/
meld # diff viewer

## Old programs

ranger # file explorer in terminal
neofetch # am I a geek now?
httpie # fun http viewer
detox # rename files
micro # text editor
exa # ls but newer
```

