#!/bin/bash
set -e

echo "🚀 Setting up your Mac..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install packages from Brewfile
echo "Installing system packages..."
if [ -f "Brewfile" ]; then
    brew bundle install --file=Brewfile
else
    echo "⚠️  No Brewfile found!"
    exit 1
fi

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/install.sh)" "" --unattended
fi

# Install nvm and Node.js if not present
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

    # Load nvm in current shell
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install Node.js
    echo "Installing Node.js..."
    nvm install 22
    nvm use 22

    # Install global npm packages from list
    if [ -f "node/global-packages.txt" ]; then
        echo "Installing global npm packages..."
        while read package; do
            if [[ $package && ${package:0:1} != "#" ]]; then
                echo "Installing $package..."
                npm install -g "$package"
            fi
        done < node/global-packages.txt
    fi
fi

# Deploy dotfiles using stow
echo "Deploying dotfiles..."
stow git zsh ghostty node claude-code

# Optional: Configure macOS defaults (uncomment if you create this)
# if [ -f "macos-defaults.sh" ]; then
#     echo "Configuring macOS defaults..."
#     ./macos-defaults.sh
# fi

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Verify Node.js: node -v && npm -v"
echo "3. Verify global packages: npm list -g --depth=0"
