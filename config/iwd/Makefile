install: packages link service

link:
	sudo mkdir -p /etc/NetworkManager/conf.d
	sudo ln -sfnv $(shell pwd)/wifi-backend.conf /etc/NetworkManager/conf.d/wifi-backend.conf

packages:
	sudo pacman -S --needed --noconfirm iwd

service:
	sudo systemctl stop wpa_supplicant || true
	sudo systemctl disable wpa_supplicant || true
	sudo systemctl enable --now iwd
	sudo systemctl restart NetworkManager

.PHONY: install link packages service
