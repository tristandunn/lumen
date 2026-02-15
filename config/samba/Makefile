install: packages link service

link:
	mkdir -p $(HOME)/Public
	sudo mkdir -p /etc/samba
	sudo ln -sfnv $(shell pwd)/smb.conf /etc/samba/smb.conf
	sudo mkdir -p /etc/avahi/services
	sudo ln -sfnv $(shell pwd)/smb.service /etc/avahi/services/smb.service

packages:
	sudo pacman -S --needed --noconfirm avahi nss-mdns samba

service:
	sudo systemctl enable --now avahi-daemon nmbd smbd

.PHONY: install link packages service
