# My Dotfiles

Personal configuration files managed with GNU Stow.

## Setup on New Machine

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
brew bundle install

# Install stow
brew install stow

# Deploy configurations
stow git zsh ghostty vim tmux
# Add other packages as needed
```

## Packages

- `git/` - Git configuration
- `zsh/` - Zsh shell configuration
- `ghostty/` - Ghostty terminal configuration

## Adding New Configurations

1. Create package directory: `mkdir package-name`
2. Move config files: `mv ~/.config/app package-name/.config/`
3. Deploy with stow: `stow package-name`
4. Commit changes: `git add . && git commit -m "Add package-name config"`
