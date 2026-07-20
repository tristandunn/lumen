install: packages link service

link:
	mkdir -p $(HOME)/.config/systemd/user
	ln -sfnv $(shell pwd)/swayosd.service $(HOME)/.config/systemd/user/swayosd.service

packages:
	sudo pacman -S --needed --noconfirm swayosd

service:
	systemctl --user daemon-reload
	systemctl --user restart swayosd.service

.PHONY: install link packages service
