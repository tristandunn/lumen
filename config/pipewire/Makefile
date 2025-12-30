install: link

link:
	mkdir -p $(HOME)/.config/pipewire/pipewire.conf.d
	mkdir -p $(HOME)/.config/wireplumber/wireplumber.conf.d
	ln -sfnv $(shell pwd)/pipewire.conf.d/10-gaming.conf \
		$(HOME)/.config/pipewire/pipewire.conf.d/10-gaming.conf
	ln -sfnv $(shell pwd)/wireplumber.conf.d/50-bluetooth-codecs.conf \
		$(HOME)/.config/wireplumber/wireplumber.conf.d/50-bluetooth-codecs.conf

.PHONY: install link
