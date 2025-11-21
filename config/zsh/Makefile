link:
	ln -sfnv $(shell pwd)/zshrc $(HOME)/.zshrc
	ln -sfnv $(shell pwd)/zshenv $(HOME)/.zshenv
	ln -sfnv $(shell pwd)/zlogin $(HOME)/.zlogin
	ln -sfnv $(shell pwd)/aliases $(HOME)/.aliases
	mkdir -p $(HOME)/.local/bin
	ln -sfnv $(shell pwd)/bin/audio-switch $(HOME)/.local/bin/audio-switch
	ln -sfnv $(shell pwd)/bin/brightness-control $(HOME)/.local/bin/brightness-control
	ln -sfnv $(shell pwd)/bin/hypr-dispatch $(HOME)/.local/bin/hypr-dispatch
	ln -sfnv $(shell pwd)/bin/llm $(HOME)/.local/bin/llm
	ln -sfnv $(shell pwd)/bin/t $(HOME)/.local/bin/t

packages:
	sudo pacman -S --needed --noconfirm jq

install: packages link

.PHONY: install link packages
