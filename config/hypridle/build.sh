#!/usr/bin/env bash

set -e

if command -v asdcontrol >/dev/null 2>&1; then
  echo "asdcontrol is already installed"
  exit 0
fi

BUILD_DIR=$(mktemp -d)

echo "Cloning asdcontrol repository..."
git clone https://github.com/nikosdion/asdcontrol "$BUILD_DIR"

echo "Compiling asdcontrol..."
cd "$BUILD_DIR"
make

echo "Installing asdcontrol to /usr/local/bin..."
sudo cp asdcontrol /usr/local/bin/asdcontrol
sudo chmod +x /usr/local/bin/asdcontrol

echo "Cleaning up build directory..."
rm -rf "$BUILD_DIR"

echo "Setting up sudoers rule for passwordless sudo..."
echo "$USER ALL=(ALL) NOPASSWD: /usr/local/bin/asdcontrol" | sudo tee /etc/sudoers.d/asdcontrol > /dev/null
sudo chmod 440 /etc/sudoers.d/asdcontrol
