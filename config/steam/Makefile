link:
	mkdir -p $(HOME)/.local/bin
	ln -sfnv $(shell pwd)/steam-run $(HOME)/.local/bin/steam-run

packages:
	./install.sh

install: packages link

.PHONY: install link packages
