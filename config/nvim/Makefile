install: packages packages-npm packages-gem link

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
		dockerfile-language-server \
		eslint-language-server \
		lua-language-server \
		neovim \
		tailwindcss-language-server \
		vscode-json-languageserver \
		yaml-language-server

packages-npm:
	@npm list -g @herb-tools/language-server >/dev/null 2>&1 || npm install -g @herb-tools/language-server
	@npm list -g @herb-tools/linter >/dev/null 2>&1 || npm install -g @herb-tools/linter
	@npm list -g stylelint-lsp >/dev/null 2>&1 || npm install -g stylelint-lsp

packages-gem:
	@gem list -i ruby-lsp >/dev/null 2>&1 || gem install ruby-lsp
	@gem list -i ruby-lsp-rails >/dev/null 2>&1 || gem install ruby-lsp-rails
	@gem list -i ruby-lsp-rspec >/dev/null 2>&1 || gem install ruby-lsp-rspec

.PHONY: install link packages packages-npm packages-gem
