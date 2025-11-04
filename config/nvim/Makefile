link:
	mkdir -p $(HOME)/.config/nvim/lua
	ln -sfnv $(shell pwd)/.luarc.json $(HOME)/.config/nvim/.luarc.json
	ln -sfnv $(shell pwd)/init.lua $(HOME)/.config/nvim/init.lua
	ln -sfnv $(shell pwd)/colors $(HOME)/.config/nvim/colors
	ln -sfnv $(shell pwd)/lsp $(HOME)/.config/nvim/lua/lsp
	ln -sfnv $(shell pwd)/plug-ins $(HOME)/.config/nvim/lua/plug-ins
	ln -sfnv $(shell pwd)/settings $(HOME)/.config/nvim/lua/settings

packages:
	sudo pacman -S --needed --noconfirm neovim

install: packages link

.PHONY: install link packages
