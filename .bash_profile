# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z "$DISPLAY" ]]; then
    if [[ "$(tty)" == "/dev/tty1" ]]; then
        startx
    elif [[ "$(tty)" == "/dev/tty2" ]]; then
        hyprland
    fi
fi
