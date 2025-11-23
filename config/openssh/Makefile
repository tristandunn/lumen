install: packages link

link:
	mkdir -p $(HOME)/.ssh
	ln -sfnv $(shell pwd)/config $(HOME)/.ssh/config

packages:
	sudo pacman -S --needed --noconfirm openssh

.PHONY: install link packages
