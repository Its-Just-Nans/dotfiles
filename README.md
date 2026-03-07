# dotfiles

dotfiles

## Setup

```sh
git clone https://github.com/Its-Just-Nans/dotfiles.git && cd dotfiles && ./setup.sh setup
```

## Others

```sh
# install deps
apt install pkg-config gcc clang make git curl libssl-dev xclip python-is-python3
```

- setup shortcuts
- setup SSH key and GPG

```sh
# check install programs
./setup.sh check

apt install $(./setup.sh install)
cargo install $(cat cargo.txt)
```

## Save settings

```sh
./setup.sh save
```

