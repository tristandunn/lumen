install: packages link service realtime

link:
	mkdir -p $(HOME)/.config/pipewire/pipewire.conf.d
	mkdir -p $(HOME)/.config/wireplumber/wireplumber.conf.d
	ln -sfnv $(shell pwd)/pipewire.conf.d/10-low-latency.conf \
		$(HOME)/.config/pipewire/pipewire.conf.d/10-low-latency.conf
	ln -sfnv $(shell pwd)/wireplumber.conf.d/50-bluetooth-codecs.conf \
		$(HOME)/.config/wireplumber/wireplumber.conf.d/50-bluetooth-codecs.conf

packages:
	sudo pacman -S --needed --noconfirm libldac pipewire-pulse pipewire-jack realtime-privileges

service:
	systemctl --user enable --now pipewire-pulse

realtime:
	sudo gpasswd -a $(USER) realtime
	@echo "Log out and back in for the realtime group to take effect."

.PHONY: install link packages service realtime
