install: packages link service

link:
	sudo mkdir -p /etc/keyd
	sudo ln -sfnv $(shell pwd)/default.conf /etc/keyd/default.conf
	sudo keyd reload || true

packages:
	sudo pacman -S --needed --noconfirm keyd

service:
	sudo systemctl enable --now keyd

.PHONY: install link packages service
