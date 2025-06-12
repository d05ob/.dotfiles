#!/bin/bash
set -e
cd ~/.dotfiles

# Linking .config files
config_dirs=(
    .config/dmenu
    .config/dwm
    .config/st
    .config/wallpapers
    .config/nvim
    .config/hypr
    .config/wofi
    .config/waybar
    .config/kitty
)

for dir in "${config_dirs[@]}"; do
    ln -sf "$PWD/$dir" "$HOME/.config/$(basename "$dir")"
done

# Linking home directory dotfiles
home_files=(
    .bashrc
    .bash_profile
    .xinitrc
    .tmux.conf
)

for file in "${home_files[@]}"; do
    ln -sf "$PWD/$file" "$HOME/$file"
done

