install: link local packages

link:
	mkdir -p $(HOME)/.config/git
	ln -sfnv $(shell pwd)/config $(HOME)/.gitconfig
	ln -sfnv $(shell pwd)/attributes $(HOME)/.config/git/attributes
	ln -sfnv $(shell pwd)/ignore $(HOME)/.config/git/ignore

local:
	@test -f $(HOME)/.config/git/local || cp $(shell pwd)/local.template $(HOME)/.config/git/local

packages:
	sudo pacman -S --needed --noconfirm github-cli

.PHONY: install link local packages
