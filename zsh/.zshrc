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
  bat
)

source $ZSH/oh-my-zsh.sh

# Initialize zoxide (smart cd replacement)
eval "$(zoxide init zsh)"

# Initialize fzf (fuzzy finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fd for fzf's file finding (faster than default find)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd for directory finding with Alt+C
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# Enhanced fzf options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# === Utility Functions ===

# Interactive file search and edit
fzf-edit() {
    local file
    file=$(fd --type f --hidden --follow --exclude .git | fzf --preview 'bat --color=always --style=header,grid --line-range :300 {}')
    if [[ -n $file ]]; then
        ${EDITOR:-code} "$file"
    fi
}
alias fe="fzf-edit"

# Interactive ripgrep - search content, then edit
fzf-ripgrep() {
    local file
    file=$(rg --files-with-matches --no-messages "$1" | fzf --preview "rg --ignore-case --pretty --context 10 '$1' {}")
    if [[ -n $file ]]; then
        ${EDITOR:-code} "$file"
    fi
}
alias fr="fzf-ripgrep"

# Quick project search
search-project() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: search-project <pattern>"
        return 1
    fi
    rg --type-add 'web:*.{html,css,js,ts,jsx,tsx,vue}' \
       --type web \
       --type js \
       --type py \
       --type rust \
       --type go \
       --ignore-case \
       --pretty \
       --context 3 \
       "$@"
}

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

# Useful shortcuts
alias code-review="claude-code review ."
alias code-explain="claude-code explain"

# zoxide aliases (optional - zoxide init creates these automatically)
alias cd="z"                # Replace cd with z
alias cdi="zi"              # Interactive mode with fzf

# Modern CLI replacements
alias grep="rg"             # Use ripgrep instead of grep
alias find="fd"             # Use fd instead of find

# Useful ripgrep aliases
alias search="rg -i"        # Case-insensitive search
alias searchall="rg -u"     # Search including hidden/ignored files

# Useful fd aliases
alias findname="fd -t f"    # Find files only
alias finddir="fd -t d"     # Find directories only
alias findhidden="fd -H"    # Include hidden files
