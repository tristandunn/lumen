#!/usr/bin/env bash

set -e

# Skip if it's already installed.
if command -v yay &> /dev/null; then
  exit 0
fi

# Set up the keyrings if they're not present.
if [[ ! -d /etc/pacman.d/gnupg ]] || [[ ! -f /etc/pacman.d/gnupg/trustdb.gpg ]]; then
  sudo pacman-key --init
  sudo pacman-key --populate archlinux
fi

# Clone the project.
TEMP_DIR=$(mktemp -d)
git clone https://aur.archlinux.org/yay-bin.git "$TEMP_DIR"

# Install the package.
cd "$TEMP_DIR"
makepkg -si --noconfirm

# Clean up the clone.
cd -
rm -rf "$TEMP_DIR"
