packages:
	sudo pacman -S --needed --noconfirm pipewire-pulse
	yay -S --needed --noconfirm swayosd

services:
	systemctl --user enable --now pipewire-pulse

install: packages services

.PHONY: install packages services
