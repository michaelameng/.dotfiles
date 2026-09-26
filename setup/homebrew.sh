#!/usr/bin/env zsh
set -euo pipefail

# Install Homebrew if it's not installed
if [[ -z "$(command -v brew 2>/dev/null)" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install formulae/casks and vscode extensions
brew bundle install --file=~/.dotfiles/config/Brewfile

# Automatically update Homebrew daily
brew autoupdate start --upgrade --immediate --cleanup

# Update the `Brewfile` once a week (need to give `cron` Full-Disk Access)
if [[ -z "$(crontab -l 2>/dev/null || true)" ]]; then
  echo "0 0 * * 0 /opt/homebrew/bin/brew bundle dump --file=~/.dotfiles/config/Brewfile --force > /dev/null 2>&1" | crontab -
fi