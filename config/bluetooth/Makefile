install: packages configure service

configure:
	sudo mkdir -p /etc/bluetooth
	sudo ln -sfnv $(shell pwd)/main.conf /etc/bluetooth/main.conf

packages:
	sudo pacman -S --needed --noconfirm bluez bluez-utils

service:
	sudo systemctl enable --now bluetooth

.PHONY: install configure packages service
