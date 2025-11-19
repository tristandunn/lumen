link:
	mkdir -p $(HOME)/.ssh
	ln -sfnv $(shell pwd)/config $(HOME)/.ssh/config

packages:
	sudo pacman -S --needed --noconfirm openssh

install: packages link

.PHONY: install link packages
