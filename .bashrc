
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors for ls & grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Function to get Git branch
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}

# Colors (Cyberpunk Blue-Grey Theme)
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

# PS1 Setup (Cyberpunk Colors + Icons)
PS1="${FG_GREY}┌─${FG_CYAN} \u ${FG_GREY}at ${FG_BLUE}\h ${FG_GREY}in ${FG_SILVER}${DIR_ICON} \w \[$FG_YELLOW\]\$(parse_git_branch | sed 's/^/ '${GIT_ICON}' /')\n"
PS1+="${FG_GREY}└─${FG_BOLDWHITE}${PROMPT_ARROW} ${RESET}"

# Enable Zsh-like menu completion
bind 'set show-all-if-ambiguous off'  # Don't show all matches immediately
bind 'set menu-complete-display-prefix on'  # Show common prefix
bind '"\t": menu-complete'  # Tab cycles through matches
bind '"\e[Z": menu-complete-backward'  # Shift+Tab cycles backwards
