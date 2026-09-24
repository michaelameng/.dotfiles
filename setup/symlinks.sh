#!/usr/bin/env zsh

# Symlink `.config`
rm -rf ~/.config
ln -s ~/.dotfiles/config/.config ~/.config

# Symlink `.hushlogin`
rm -rf ~/.hushlogin
ln -s ~/.dotfiles/config/.hushlogin ~/.hushlogin

# Symlink `.zshrc`
rm -rf ~/.zshrc
ln -s ~/.dotfiles/config/.zshrc ~/.zshrc
