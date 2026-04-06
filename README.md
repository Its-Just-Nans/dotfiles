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

