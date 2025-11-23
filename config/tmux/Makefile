install: packages link

link:
	ln -sfnv $(shell pwd)/tmux.conf $(HOME)/.tmux.conf

packages:
	sudo pacman -S --needed --noconfirm tmux wl-clipboard

.PHONY: install link packages
