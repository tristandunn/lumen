install: packages link build

build:
	mise install

link:
	ln -sfnv $(shell pwd)/tool-versions $(HOME)/.tool-versions
	ln -sfnv $(shell pwd)/gemrc $(HOME)/.gemrc

packages:
	sudo pacman -S --needed --noconfirm libyaml mise

.PHONY: build install link packages
