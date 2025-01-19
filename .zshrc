# Set up the prompt
fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit

#export TYPEWRITTEN_PROMPT_LAYOUT="half_pure" # singleline/pure/half_pure/multiline
export TYPEWRITTEN_RELATIVE_PATH="adaptive"
#export TYPEWRITTEN_CURSOR="terminal"
#export TYPEWRITTEN_SYMBOL="$"
export TYPEWRITTEN_COLOR_MAPPINGS="secondary:#8ec07c;primary:#83a598"
export EDITOR="nvim"
prompt typewritten

setopt histignorealldups sharehistory correctall

bindkey "^[[3~" delete-char
bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# Which information to display.
# NOTE: If 'ascii' will be used, it must come first.
# Default: first example below
# Valid: space separated string
#
# OFF by default: shell editor wm de palette
export PF_INFO="title os host kernel uptime pkgs memory shell editor wm palette"
# Separator between info name and info data.
# Default: unset
# Valid: string
export PF_SEP=""

# Enable/Disable colors in output:
# Default: 1
# Valid: 1 (enabled), 0 (disabled)
export PF_COLOR=1

# Color of info names:
# Default: unset (auto)
# Valid: 0-9
export PF_COL1=4

# Color of info data:
# Default: unset (auto)
# Valid: 0-9
export PF_COL2=9

# Color of title data:
# Default: unset (auto)
# Valid: 0-9
export PF_COL3=6

# Alignment padding.
# Default: unset (auto)
# Valid: int
export PF_ALIGN="10"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
ENABLE_CORRECTION=true
# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias rec="ffmpeg -f x11grab -video_size 1920x1080 -framerate 60 -i :0"
alias neovide="neovide && exit"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
