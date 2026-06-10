install: packages link

link:
	mkdir -p $(HOME)/.config/hypr
	ln -sfnv $(shell pwd)/appearance.lua $(HOME)/.config/hypr/appearance.lua
	ln -sfnv $(shell pwd)/bindings.lua $(HOME)/.config/hypr/bindings.lua
	ln -sfnv $(shell pwd)/environment.lua $(HOME)/.config/hypr/environment.lua
	ln -sfnv $(shell pwd)/hyprland.lua $(HOME)/.config/hypr/hyprland.lua
	ln -sfnv $(shell pwd)/input.lua $(HOME)/.config/hypr/input.lua
	ln -sfnv $(shell pwd)/monitors.lua $(HOME)/.config/hypr/monitors.lua
	ln -sfnv $(shell pwd)/startup.lua $(HOME)/.config/hypr/startup.lua
	ln -sfnv $(shell pwd)/voxtype.lua $(HOME)/.config/hypr/voxtype.lua

packages:
	sudo pacman -S --needed --noconfirm hyprland xdg-desktop-portal-hyprland
	yay -S --needed --noconfirm apple_cursor

.PHONY: install link packages
