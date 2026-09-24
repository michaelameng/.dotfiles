#!/usr/bin/env zsh

# Install all Homebrew formulae/casks
brew bundle install --file="~/.dotfiles/config/Brewfile"

# Start homebrew-autoupdate with flags
brew autoupdate start --upgrade --immediate --cleanup
