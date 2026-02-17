install: packages configure service

configure:
	sudo mkdir -p /etc/bluetooth
	sudo cp -v $(shell pwd)/main.conf /etc/bluetooth/main.conf
	sudo cp -v $(shell pwd)/90-wakeup.rules /etc/udev/rules.d/90-wakeup.rules

packages:
	sudo pacman -S --needed --noconfirm bluez bluez-utils

service:
	sudo systemctl enable --now bluetooth

.PHONY: install configure packages service
