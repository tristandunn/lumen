install: packages link

packages:
	sudo pacman -S --needed --noconfirm bluetui ttf-nerd-fonts-symbols waybar

link:
	mkdir -p $(HOME)/.config/waybar
	ln -sfnv $(shell pwd)/config.jsonc $(HOME)/.config/waybar/config.jsonc
	ln -sfnv $(shell pwd)/style.css $(HOME)/.config/waybar/style.css

.PHONY: install packages link
