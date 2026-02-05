install: packages service

packages:
	sudo pacman -S --needed --noconfirm tailscale

service:
	sudo systemctl enable --now tailscaled

.PHONY: install packages service
