# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z "$DISPLAY" ]]; then
    if [[ "$(tty)" == "/dev/tty1" ]]; then
        # startx
        hyprland
    elif [[ "$(tty)" == "/dev/tty2" ]]; then
        # hyprland
        startx
    fi
fi
