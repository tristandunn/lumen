install: packages link

link:
	mkdir -p $(HOME)/.config/gopass $(HOME)/.local/bin
	ln -sfnv $(shell pwd)/config $(HOME)/.config/gopass/config
	ln -sfnv $(shell pwd)/lumen-gopass-import-apple $(HOME)/.local/bin/lumen-gopass-import-apple

packages:
	sudo pacman -S --needed --noconfirm git gnupg gopass gopass-jsonapi rng-tools

.PHONY: install link packages
