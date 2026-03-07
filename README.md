# dotfiles

dotfiles

## Setup

```sh
git clone https://github.com/Its-Just-Nans/dotfiles.git && cd dotfiles && ./setup.sh
```

## Others

```sh
# install deps
apt install pkg-config gcc clang make git curl libssl-dev xclip python-is-python3
```

- setup shortcuts
- setup SSH key and GPG
- <https://neovim.io/doc/install/>
- <https://github.com/nvm-sh/nvm>
- <https://go.dev/doc/install>
- <https://github.com/jesseduffield/lazygit>

```sh
apt install $(./setup.sh install)
cargo install $(cat cargo.txt)
```

## Save settings

```sh
./setup.sh save
```
