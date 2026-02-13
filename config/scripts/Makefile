install: packages link

link:
	mkdir -p $(HOME)/.local/bin
	ln -sfnv $(shell pwd)/lumen-audio-sink $(HOME)/.local/bin/lumen-audio-sink
	ln -sfnv $(shell pwd)/lumen-audio-switch $(HOME)/.local/bin/lumen-audio-switch
	ln -sfnv $(shell pwd)/lumen-bluetooth-reconnect $(HOME)/.local/bin/lumen-bluetooth-reconnect
	ln -sfnv $(shell pwd)/lumen-brightness-control $(HOME)/.local/bin/lumen-brightness-control
	ln -sfnv $(shell pwd)/lumen-hypr-dispatch $(HOME)/.local/bin/lumen-hypr-dispatch
	ln -sfnv $(shell pwd)/lumen-screenshot $(HOME)/.local/bin/lumen-screenshot
	ln -sfnv $(shell pwd)/lumen-waybar-reload $(HOME)/.local/bin/lumen-waybar-reload
	ln -sfnv $(shell pwd)/pkg $(HOME)/.local/bin/pkg

packages:
	sudo pacman -S --needed --noconfirm grim imv jq slurp

.PHONY: install link packages
