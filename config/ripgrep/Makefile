install: packages link

link:
	ln -sfnv $(shell pwd)/ripgreprc $(HOME)/.ripgreprc
	ln -sfnv $(shell pwd)/rgignore $(HOME)/.rgignore

packages:
	sudo pacman -S --needed --noconfirm ripgrep

.PHONY: install link packages
