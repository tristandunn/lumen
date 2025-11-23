install: packages configure link service

configure:
	sudo mkdir -p /etc/sddm.conf.d
	sed 's/{{USER}}/$(USER)/g' autologin.conf.template | sudo tee /etc/sddm.conf.d/autologin.conf > /dev/null

link:
	sudo mkdir -p /usr/share/wayland-sessions
	sudo ln -sfnv $(shell pwd)/hyprland.desktop /usr/share/wayland-sessions/hyprland.desktop

packages:
	sudo pacman -S --needed --noconfirm sddm

service:
	sudo systemctl enable --now sddm

.PHONY: configure install link packages service
