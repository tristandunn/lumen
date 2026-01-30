install: packages link

link:
	mkdir -p $(HOME)/.config/hypr
	ln -sfnv $(shell pwd)/hyprlock.conf $(HOME)/.config/hypr/hyprlock.conf
	mkdir -p $(HOME)/Pictures/Wallpapers
	ln -sfnv $(shell pwd)/default.jpeg $(HOME)/Pictures/Wallpapers/default.jpeg

packages:
	sudo pacman -S --needed --noconfirm hyprlock

.PHONY: install link packages
