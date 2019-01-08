# Save history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

setopt no_nomatch # Disable parse wildcard

autoload -U colors && colors # Enable color support
autoload -Uz compinit && compinit -i # Enable compinit

zstyle ':completion:*' menu select # Menu selector
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive
# History search for keybinding
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

# History search by entered text
bindkey "OA" history-beginning-search-backward
bindkey "OB" history-beginning-search-forward
