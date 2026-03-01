# dotfiles

dotfiles

## Setup

```sh
git clone https://github.com/Its-Just-Nans/dotfiles.git && cd dotfiles && ./setup.sh
```

## Others

```sh
# install deps
apt install gcc clang make git curl libssl-dev
```

- setup shortcuts
- setup SSH key and GPG
- <https://neovim.io/doc/install/>
- <https://go.dev/doc/install>
- <https://github.com/jesseduffield/lazygit>


```sh
# reinstall cargo packages
cargo install --root .cargo/ --list \
  | grep -E '^[a-zA-Z0-9_-]+ v' \
  | awk '{print $1}' \
  | xargs -n1 cargo install
```


