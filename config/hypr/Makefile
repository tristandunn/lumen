link:
	ln -sfnv $(shell pwd) $(HOME)/.config/hypr

packages:
	sudo pacman -S --needed --noconfirm hyprland xdg-desktop-portal-hyprland

install: packages link

.PHONY: install link packages
