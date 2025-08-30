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

# Your custom aliases
alias gconfig="code ~/dotfiles/ghostty/.config/ghostty/config"
alias dotfiles="cd ~/dotfiles"

# pnpm aliases
alias pi="pnpm install"
alias pr="pnpm run"
alias px="pnpx"

# Claude Code aliases
alias cc="claude-code"
alias ccr="claude-code review"
alias ccc="claude-code chat"
alias ccf="claude-code fix"

# Useful shortcuts
alias code-review="claude-code review ."
alias code-explain="claude-code explain"
