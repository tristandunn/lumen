link:
	mkdir -p $(HOME)/.config/nvim
	ln -sfnv $(shell pwd)/.luarc.json $(HOME)/.config/nvim/.luarc.json
	ln -sfnv $(shell pwd)/init.lua $(HOME)/.config/nvim/init.lua
	ln -sfnv $(shell pwd)/colors $(HOME)/.config/nvim/colors
	ln -sfnv $(shell pwd)/lsp $(HOME)/.config/nvim/lsp
	ln -sfnv $(shell pwd)/plug-ins $(HOME)/.config/nvim/plug-ins
	ln -sfnv $(shell pwd)/settings $(HOME)/.config/nvim/settings

packages:
	sudo pacman -S --needed --noconfirm neovim

install: packages link

.PHONY: install link packages
