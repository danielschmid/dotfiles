# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
plugins=(
  git
  brew
  macos
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Your custom aliases
alias gconfig="code ~/dotfiles/ghostty/.config/ghostty/config"
alias dotfiles="cd ~/dotfiles"

# Your custom configurations go here
