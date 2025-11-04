link:
	ln -sfnv $(shell pwd)/tool-versions $(HOME)/.tool-versions

packages:
	sudo pacman -S --needed --noconfirm mise

setup:
	mise install

install: packages link setup

.PHONY: install link packages setup
