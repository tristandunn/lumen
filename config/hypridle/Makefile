install: build packages link

build:
	./build.sh

link:
	mkdir -p $(HOME)/.config/hypr
	ln -sfnv $(shell pwd)/hypridle.conf $(HOME)/.config/hypr/hypridle.conf

packages:
	sudo pacman -S --needed --noconfirm hypridle

.PHONY: build install link packages
