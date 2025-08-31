#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Auto-start tmux in interactive GUI terminals only
if [ -z "$TMUX" ] && [ -n "$DISPLAY" ] && [ -t 1 ]; then
    exec tmux
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
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

nc() {
  CUR_DIR=$(pwd)
  case "$CUR_DIR" in
    "$HOME"/*|"$HOME")
      FILE=$(find . -type f 2>/dev/null | fzf --preview "bat --style=numbers --color=always --line-range=1:100 {}" --preview-window=right:60%)
      if [ -n "$FILE" ]; then
        nvim "$FILE"
      fi
      ;;
    *)
      echo "You're outside your home directory. nc only works inside \$HOME."
      ;;
  esac
}

alias nv='nvim'

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
GIT_ICON="" 
DIR_ICON=""  


# PS1 Setup 
PS1="${FG_GREY}┌─${FG_CYAN} \u ${FG_GREY}at ${FG_BLUE}\h ${FG_GREY}in ${FG_SILVER}${DIR_ICON} \w \[$FG_YELLOW\]\$(parse_git_branch | sed 's/^/ '${GIT_ICON}' /')\n"
PS1+="${FG_GREY}└─${FG_BOLDWHITE}${PROMPT_ARROW} ${RESET}"

# Enable menu completion
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

export PATH=/home/pwe/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin
