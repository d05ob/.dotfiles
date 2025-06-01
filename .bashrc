#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Auto-start tmux in interactive GUI terminals only
if [ -z "$TMUX" ] && [ -n "$DISPLAY" ] && [ -t 1 ]; then
    exec tmux
fi

# Enable colors for ls & grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ll='ls -AlF'
alias la='ls -A'
ncd() {
  CUR_DIR=$(pwd)
  case "$CUR_DIR" in
    "$HOME"/*|"$HOME")
      FILE=$(find . -type f 2>/dev/null | fzf --preview "bat --style=numbers --color=always --line-range=1:100 {}" --preview-window=right:60%)
      if [ -n "$FILE" ]; then
        DIR=$(dirname "$FILE")
        cd "$DIR" && nvim "$(basename "$FILE")"
      fi
      ;;
    *)
      echo "You're outside your home directory. ncd only works inside \$HOME."
      ;;
  esac
}

alias nv='nvim'
# Function to get Git branch
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}

# Colors 
RESET='\[\e[0m\]'
FG_CYAN='\[\e[1;36m\]'   # Bright Cyan (Username)
FG_BLUE='\[\e[1;34m\]'   # Deep Blue (Hostname)
FG_GREY='\[\e[1;90m\]'   # Dark Grey (Decorative Lines)
FG_SILVER='\[\e[0;37m\]' # Silver Grey (Path)
FG_YELLOW='\[\e[1;33m\]' # Yellow (Git Branch)
FG_BOLDWHITE='\[\e[1;97m\]' # Bright White (Final Prompt Arrow)

# Symbols
PROMPT_ARROW="➜"
GIT_ICON=""  # Requires Nerd Font
DIR_ICON=""  # Requires Nerd Font


# PS1 Setup 
PS1="${FG_GREY}┌─${FG_CYAN} \u ${FG_GREY}at ${FG_BLUE}\h ${FG_GREY}in ${FG_SILVER}${DIR_ICON} \w \[$FG_YELLOW\]\$(parse_git_branch | sed 's/^/ '${GIT_ICON}' /')\n"
PS1+="${FG_GREY}└─${FG_BOLDWHITE}${PROMPT_ARROW} ${RESET}"

# Enable Zsh-like menu completion
bind 'set show-all-if-ambiguous off'  # Don't show all matches immediately
bind 'set menu-complete-display-prefix on'  # Show common prefix
bind '"\t": menu-complete'  # Tab cycles through matches
bind '"\e[Z": menu-complete-backward'  # Shift+Tab cycles backwards


export PATH=/home/pwe/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin
