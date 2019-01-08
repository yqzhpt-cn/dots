# Download antigen automatically
[[ ! -f ~/.zsh/antigen.zsh ]] && curl -L git.io/antigen > ~/.zsh/antigen.zsh
source ~/.zsh/antigen.zsh # Enable antigen

# Plugins 
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply # Ready

source ~/.zsh/env.zsh # Custom env
source ~/.zsh/settings.zsh # Custom settings
source ~/.zsh/alias.zsh # Custom alias
source ~/.zsh/prompt.zsh # Custom prompt
