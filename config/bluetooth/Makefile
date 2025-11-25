install: packages configure link service

configure:
	sudo mkdir -p /etc/bluetooth
	sudo ln -sfnv $(shell pwd)/main.conf /etc/bluetooth/main.conf

link:
	mkdir -p $(HOME)/.config/wireplumber/wireplumber.conf.d
	ln -sfnv $(shell pwd)/50-bluetooth-codecs.conf \
		$(HOME)/.config/wireplumber/wireplumber.conf.d/50-bluetooth-codecs.conf

packages:
	sudo pacman -S --needed --noconfirm bluez bluez-utils

service:
	sudo systemctl enable --now bluetooth

.PHONY: install configure link packages service
