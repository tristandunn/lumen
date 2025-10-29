asdcontrol:
	bash $(shell pwd)/install-asdcontrol.sh

link:
	mkdir -p $(HOME)/.config/hypr
	ln -sfnv $(shell pwd)/hypridle.conf $(HOME)/.config/hypr/hypridle.conf

packages:
	sudo pacman -S --needed --noconfirm hypridle

install: packages asdcontrol link

.PHONY: install link packages asdcontrol
