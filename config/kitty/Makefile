link:
	ln -sfnv $(shell pwd) $(HOME)/.config/kitty

packages:
	sudo pacman -S --needed --noconfirm kitty ttf-monaspace-variable

install: packages link

.PHONY: install link packages
