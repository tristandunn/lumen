.PHONY: install packages service config

packages:
	sudo pacman -S --needed --noconfirm bluez bluez-utils blueman pavucontrol pipewire pipewire-pulse pipewire-audio wireplumber

service:
	sudo systemctl enable --now bluetooth

config:
	sudo install -Dm644 hid_apple.conf /etc/modprobe.d/hid_apple.conf
	sudo install -Dm644 hid_magicmouse.conf /etc/modprobe.d/hid_magicmouse.conf

install: packages service config
