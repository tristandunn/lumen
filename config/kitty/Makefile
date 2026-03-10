install: packages link

link:
	ln -sfnv $(shell pwd) $(HOME)/.config/kitty

packages:
	sudo pacman -S --needed --noconfirm kitty ttf-monaspace-variable noto-fonts-emoji

.PHONY: install link packages
