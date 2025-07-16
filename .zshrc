# prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# exports
export EDITOR="nvim"
export MICRO_TRUECOLOR=1
export COLORTERM="truecolor"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export SAL_USE_VCLPLUGIN=gtk3
setopt histignorealldups sharehistory correctall
export XCURSOR_THEME="GoogleDot Rose Pine"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

# binds
bindkey -e
bindkey "^[[U"  backward-kill-line
bindkey "^[[3~" delete-char
bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward

# pfetch config

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

# aliases
alias zapret="sudo bash /home/artem/zapret-discord-youtube-linux/main_script.sh -nointeractive"
alias alacritty="alacritty --config-file ~/.config/alacritty/alacrity.toml"

# etc

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

# load module for list-style selection
zmodload zsh/complist

# use the module above for autocomplete selection
zstyle ':completion:*' menu yes select

# now we can define keybindings for complist module
# you want to trigger search on autocomplete items
# so we'll bind some key to trigger history-incremental-search-forward function
bindkey -M menuselect '?' history-incremental-search-forward

if [ "$TERM" = "linux" ]; then
	/bin/echo -e "
	\e]P0191724
	\e]P1eb6f92
	\e]P29ccfd8
	\e]P3f6c177
	\e]P431748f
	\e]P5c4a7e7
	\e]P6ebbcba
	\e]P7e0def4
	\e]P826233a
	\e]P9eb6f92
	\e]PA9ccfd8
	\e]PBf6c177
	\e]PC31748f
	\e]PDc4a7e7
	\e]PEebbcba
	\e]PFe0def4
	"
	# get rid of artifacts
	clear
fi
