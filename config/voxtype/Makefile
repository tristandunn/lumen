install: packages link service

link:
	mkdir -p $(HOME)/.config/voxtype
	ln -sfnv $(shell pwd)/config.toml $(HOME)/.config/voxtype/config.toml

packages:
	yay -S --needed --noconfirm wtype voxtype

service:
	systemctl --user enable --now voxtype.service

.PHONY: install link packages service
