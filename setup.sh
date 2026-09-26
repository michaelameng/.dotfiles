#!/usr/bin/env zsh
set -euo pipefail

# Execute setup scripts
./setup/settings.sh
./setup/symlinks.sh
./setup/homebrew.sh

# Restart laptop
sudo shutdown -r now
