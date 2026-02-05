install: link packages

link:
	mkdir -p $(HOME)/.config/hypr
	mkdir -p $(HOME)/Pictures/Wallpapers
	ln -sfnv $(shell pwd)/hyprpaper.conf $(HOME)/.config/hypr/hyprpaper.conf
	ln -sfnv $(shell pwd)/default.jpeg $(HOME)/Pictures/Wallpapers/default.jpeg

packages:
	sudo pacman -S --needed --noconfirm hyprpaper

.PHONY: install link packages
