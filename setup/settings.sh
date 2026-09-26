#!/usr/bin/env zsh
set -euo pipefail

# Hide unused directories in `~`
chflags hidden ~/Pictures ~/Music ~/Movies

# Unhide the `~/Library` directory
chflags nohidden ~/Library

# Show the path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Automatically hide Dock
defaults write com.apple.dock autohide -bool true

# Enable hold-to-repeat for keys
defaults write -g ApplePressAndHoldEnabled -bool false

# Set key-repeat speed to quickest
defaults write NSGlobalDomain KeyRepeat -int 1

# Lower delay before keys repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Always keep folders on top in Finder
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

# Search the current folder in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use the "Scale" effect when minimizing windows
defaults write com.apple.dock mineffect -string "scale"

# Do not show recent and suggested apps in the Dock
defaults write com.apple.dock show-recents -bool false

# Default to "List" view in Finder
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Decrease Dock size
defaults write com.apple.dock tilesize -int 45

# Enable trackpad tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Set the interface theme to "Dark" (need to update Icons separately)
defaults write -g AppleInterfaceStyle -string "Dark"