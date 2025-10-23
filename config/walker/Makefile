link:
	ln -sfnv $(shell pwd) $(HOME)/.config/walker

packages:
	sudo pacman -S --needed --noconfirm walker

install: packages link

.PHONY: install link packages
