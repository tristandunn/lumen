install: packages link service

link:
	mkdir -p $(HOME)/.docker
	ln -sfnv $(shell pwd)/config.json $(HOME)/.docker/config.json
	sudo mkdir -p /etc/docker
	sudo ln -sfnv $(shell pwd)/daemon.json /etc/docker/daemon.json
	sudo mkdir -p /etc/systemd/system/docker.service.d
	sudo ln -sfnv $(shell pwd)/limits.conf /etc/systemd/system/docker.service.d/limits.conf
	sudo systemctl daemon-reload

packages:
	sudo pacman -S --needed --noconfirm docker docker-buildx docker-compose

service:
	sudo systemctl enable --now docker
	sudo usermod -aG docker $(USER)

.PHONY: install link packages service
