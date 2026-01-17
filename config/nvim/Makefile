install: packages packages-aur packages-npm packages-gem link

link:
	mkdir -p $(HOME)/.config/nvim/lua
	ln -sfnv $(shell pwd)/.luarc.json $(HOME)/.config/nvim/.luarc.json
	ln -sfnv $(shell pwd)/init.lua $(HOME)/.config/nvim/init.lua
	ln -sfnv $(shell pwd)/colors $(HOME)/.config/nvim/colors
	ln -sfnv $(shell pwd)/lsp $(HOME)/.config/nvim/lsp
	ln -sfnv $(shell pwd)/plug-ins $(HOME)/.config/nvim/lua/plug-ins
	ln -sfnv $(shell pwd)/settings $(HOME)/.config/nvim/lua/settings

packages:
	sudo pacman -S --needed --noconfirm \
		lua-language-server \
		neovim \
		tailwindcss-language-server \
		yaml-language-server

# Note: The stylelint-lsp package requires a PGP key not on keyservers.
#
#   curl -s https://github.com/bmatcuk.gpg | gpg --import
#
packages-aur:
	yay -S --needed --noconfirm \
		dockerfile-language-server \
		stylelint-lsp \
		vscode-langservers-extracted

packages-npm:
	npm install -g \
		@herb-tools/language-server \
		@herb-tools/linter

packages-gem:
	gem install \
		ruby-lsp \
		ruby-lsp-rails \
		ruby-lsp-rspec

.PHONY: install link packages packages-aur packages-npm packages-gem
