install: packages link

link:
	mkdir -p $(HOME)/.config/hypr
	ln -sfnv $(shell pwd)/hyprlock.conf $(HOME)/.config/hypr/hyprlock.conf

packages:
	sudo pacman -S --needed --noconfirm hyprlock

.PHONY: install link packages
