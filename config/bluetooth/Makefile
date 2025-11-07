.PHONY: install packages service

packages:
	sudo pacman -S --needed --noconfirm bluez bluez-utils blueman pipewire pipewire-pulse pipewire-audio wireplumber

service:
	sudo systemctl enable --now bluetooth

install: packages service
