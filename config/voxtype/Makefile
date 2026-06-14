install: packages link service

link:
	mkdir -p $(HOME)/.config/voxtype
	ln -sfnv $(shell pwd)/config.toml $(HOME)/.config/voxtype/config.toml

packages:
	sudo pacman -S --needed --noconfirm wtype
	yay -S --needed --noconfirm voxtype-bin

service:
	systemctl --user enable --now voxtype.service

.PHONY: install link packages service
