install: packages link

link:
	ln -sfnv $(shell pwd)/zshrc $(HOME)/.zshrc
	ln -sfnv $(shell pwd)/zshenv $(HOME)/.zshenv
	ln -sfnv $(shell pwd)/zlogin $(HOME)/.zlogin
	ln -sfnv $(shell pwd)/aliases $(HOME)/.aliases
	mkdir -p $(HOME)/.local/bin
	ln -sfnv $(shell pwd)/bin/audio-sink $(HOME)/.local/bin/audio-sink
	ln -sfnv $(shell pwd)/bin/audio-switch $(HOME)/.local/bin/audio-switch
	ln -sfnv $(shell pwd)/bin/bluetooth-reconnect $(HOME)/.local/bin/bluetooth-reconnect
	ln -sfnv $(shell pwd)/bin/brightness-control $(HOME)/.local/bin/brightness-control
	ln -sfnv $(shell pwd)/bin/hypr-dispatch $(HOME)/.local/bin/hypr-dispatch
	ln -sfnv $(shell pwd)/bin/llm $(HOME)/.local/bin/llm
	ln -sfnv $(shell pwd)/bin/pkg $(HOME)/.local/bin/pkg
	ln -sfnv $(shell pwd)/bin/screenshot $(HOME)/.local/bin/screenshot

packages:
	sudo pacman -S --needed --noconfirm grim imv jq slurp

.PHONY: install link packages
