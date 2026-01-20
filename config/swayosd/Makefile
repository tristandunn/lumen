install: packages service

packages:
	sudo pacman -S --needed --noconfirm pipewire-pulse swayosd

service:
	systemctl --user enable --now pipewire-pulse

.PHONY: install packages service
