link:
	ln -sfnv $(shell pwd) $(HOME)/.config/hyprlock

packages:
	sudo pacman -S --needed --noconfirm hyprlock

install: packages link

.PHONY: install link packages
