install: packages link build

build:
	mise install

link:
	mkdir -p $(HOME)/.config/mise
	ln -sfnv $(shell pwd)/config.toml $(HOME)/.config/mise/config.toml
	ln -sfnv $(shell pwd)/gemrc $(HOME)/.gemrc

packages:
	sudo pacman -S --needed --noconfirm libyaml mise

.PHONY: build install link packages
