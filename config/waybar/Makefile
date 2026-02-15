install: packages link

packages:
	sudo pacman -S --needed --noconfirm waybar ttf-nerd-fonts-symbols
	yay -S --needed --noconfirm bluetui

link:
	mkdir -p $(HOME)/.config/waybar
	ln -sfnv $(shell pwd)/config.jsonc $(HOME)/.config/waybar/config.jsonc
	ln -sfnv $(shell pwd)/style.css $(HOME)/.config/waybar/style.css

.PHONY: install packages link
