# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
plugins=(
  git
  nvm
  brew
  macos
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Initialize zoxide (smart cd replacement)
eval "$(zoxide init zsh)"

# Initialize fzf (fuzzy finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Your custom aliases
alias gconfig="code ~/dotfiles/ghostty/.config/ghostty/config"
alias dotfiles="cd ~/dotfiles"

# Directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -la"
alias la="ls -la"

# pnpm aliases
alias pi="pnpm install"
alias pr="pnpm run"
alias px="pnpx"

# Claude Code aliases
alias cc="claude-code"
alias ccr="claude-code review"
alias ccc="claude-code chat"
alias ccf="claude-code fix"

# zoxide aliases (optional - zoxide init creates these automatically)
alias cd="z"            # Replace cd with z
alias cdi="zi"          # Interactive mode with fzf

# Useful shortcuts
alias code-review="claude-code review ."
alias code-explain="claude-code explain"
