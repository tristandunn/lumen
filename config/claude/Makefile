install: packages link

link:
	mkdir -p $(HOME)/.claude
	mkdir -p $(HOME)/.local/bin
	ln -sfnv $(shell pwd)/settings.json $(HOME)/.claude/settings.json
	ln -sfnv $(shell pwd)/sandbox $(HOME)/.local/bin/sandbox

packages:
	sudo pacman -S --needed --noconfirm python-libseccomp

.PHONY: install packages link
