link:
	ln -sfnv $(shell pwd)/ripgreprc $(HOME)/.ripgreprc
	ln -sfnv $(shell pwd)/rgignore $(HOME)/.rgignore

packages:
	sudo pacman -S --needed --noconfirm ripgrep

install: packages link

.PHONY: install link packages
