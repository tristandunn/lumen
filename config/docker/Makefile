install: packages link service

link:
	mkdir -p $(HOME)/.docker
	mkdir -p $(HOME)/.docker/credentials-age
	mkdir -p $(HOME)/.local/bin
	ln -sfnv $(shell pwd)/config.json $(HOME)/.docker/config.json
	ln -sfnv $(shell pwd)/docker-credential-age $(HOME)/.local/bin/docker-credential-age
	sudo mkdir -p /etc/docker
	sudo ln -sfnv $(shell pwd)/daemon.json /etc/docker/daemon.json
	sudo mkdir -p /etc/systemd/system/docker.service.d
	sudo ln -sfnv $(shell pwd)/limits.conf /etc/systemd/system/docker.service.d/limits.conf
	sudo systemctl daemon-reload

packages:
	sudo pacman -S --needed --noconfirm age docker docker-buildx docker-compose jq

service:
	sudo systemctl enable --now docker
	sudo usermod -aG docker $(USER)

.PHONY: install link packages service
