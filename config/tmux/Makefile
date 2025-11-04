link:
	ln -sfnv $(shell pwd)/tmux.conf $(HOME)/.tmux.conf

packages:
	sudo pacman -S --needed --noconfirm tmux

install: packages link

.PHONY: install link packages
