install: packages link

packages:
	sudo pacman -S --needed --noconfirm waybar

link:
	mkdir -p $(HOME)/.config/waybar
	ln -sf $(CURDIR)/config.jsonc $(HOME)/.config/waybar/config.jsonc
	ln -sf $(CURDIR)/style.css $(HOME)/.config/waybar/style.css

.PHONY: install packages link
