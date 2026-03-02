sync: sync-cargo sync-gnome

sync-gnome:
    dconf dump /org/gnome/terminal/ > gterminal.preferences

sync-cargo:
    cargo install --list | grep -E '^[a-zA-Z0-9_-]+ v' | awk '{print $1}' > cargo.txt
