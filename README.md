# dotfiles

dotfiles

## Setup

```sh
git clone https://github.com/Its-Just-Nans/dotfiles.git && cd dotfiles && ./setup.sh
```

## Others

```sh
# install deps
apt install pkg-config gcc clang make git curl libssl-dev xclip
```

- setup shortcuts
- setup SSH key and GPG
- <https://neovim.io/doc/install/>
- <https://github.com/nvm-sh/nvm>
- <https://go.dev/doc/install>
- <https://github.com/jesseduffield/lazygit>


```sh
# reinstall cargo packages
cargo install --root .cargo/ --list \
  | grep -E '^[a-zA-Z0-9_-]+ v' \
  | awk '{print $1}' \
  | xargs -n1 cargo install
```

```sh
apt install byobu tmux screen cmatrix thunar wireshark ffmpeg qemu-system libvirt-daemon-system virt-manager
```


## Save settings

```sh
just
```
