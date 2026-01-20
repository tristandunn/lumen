install: packages link service

link:
	sudo mkdir -p /etc/iwd
	sudo mkdir -p /etc/NetworkManager/conf.d
	sudo ln -sfnv $(shell pwd)/dns.conf /etc/NetworkManager/conf.d/dns.conf
	sudo ln -sfnv $(shell pwd)/main.conf /etc/iwd/main.conf
	sudo ln -sfnv $(shell pwd)/wifi-backend.conf /etc/NetworkManager/conf.d/wifi-backend.conf

packages:
	sudo pacman -S --needed --noconfirm iwd

service:
	sudo systemctl stop wpa_supplicant || true
	sudo systemctl disable wpa_supplicant || true
	sudo systemctl enable --now iwd
	sudo systemctl restart NetworkManager
	nm-online --timeout=30
	@until getent hosts archlinux.org >/dev/null 2>&1; do sleep 0.5; done

.PHONY: install link packages service
