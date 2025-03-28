# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Automatically start X (DWM) when logging into TTY1
if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
     startx
fi

