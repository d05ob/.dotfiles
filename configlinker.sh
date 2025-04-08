#!/bin/bash

cd ~/.dotfiles

# Linking .config files in here
for dir in .config/dmenu .config/dwm .config/st .config/wallpapers .config/nvim; do
	ln -sf "$PWD/$dir" ~/.config/$(basename "$dir")
done

#Linking config files in home directory here
for file in .bashrc .bash_profile .xinitrc .tmux.conf; do
    ln -sf "$PWD/$file" ~/"$file"
done
