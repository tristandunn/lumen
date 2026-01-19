install: packages link

link:
	mkdir -p $(HOME)/.config/hypr
	ln -sfnv $(shell pwd)/appearance.conf $(HOME)/.config/hypr/appearance.conf
	ln -sfnv $(shell pwd)/bindings.conf $(HOME)/.config/hypr/bindings.conf
	ln -sfnv $(shell pwd)/environment.conf $(HOME)/.config/hypr/environment.conf
	ln -sfnv $(shell pwd)/hyprland.conf $(HOME)/.config/hypr/hyprland.conf
	ln -sfnv $(shell pwd)/input.conf $(HOME)/.config/hypr/input.conf
	ln -sfnv $(shell pwd)/monitors.conf $(HOME)/.config/hypr/monitors.conf
	ln -sfnv $(shell pwd)/startup.conf $(HOME)/.config/hypr/startup.conf

packages:
	sudo pacman -S --needed --noconfirm hyprland xdg-desktop-portal-hyprland

.PHONY: install link packages
