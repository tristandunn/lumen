install: link packages

link:
	mkdir -p $(HOME)/.config/hypr
	ln -sfnv $(shell pwd)/hyprpaper.conf $(HOME)/.config/hypr/hyprpaper.conf

packages:
	sudo pacman -S --needed --noconfirm hyprpaper

.PHONY: install link packages
