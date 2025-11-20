#!/usr/bin/env bash

set -e

# Enable multilib repository if not already enabled.
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
  echo "Enabling multilib repository..."
  sudo sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' /etc/pacman.conf
  sudo pacman -Sy
fi

# Install Steam with AMD graphics support and gaming tools.
sudo pacman -S --needed --noconfirm \
  gamemode \
  lib32-gamemode \
  lib32-mangohud \
  lib32-mesa \
  lib32-pipewire \
  lib32-vulkan-radeon \
  mangohud \
  pipewire-alsa \
  steam \
  vulkan-radeon \
  vulkan-tools
