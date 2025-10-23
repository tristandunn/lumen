link:
	mkdir -p $(HOME)/.config/hypr
	ln -sfnv $(shell pwd)/hypridle.conf $(HOME)/.config/hypr/hypridle.conf

packages:
	sudo pacman -S --needed --noconfirm hypridle
	yay -S --needed --noconfirm asdcontrol-git

install: packages link

.PHONY: install link packages
