create-configuration:
	sudo mkdir -p /etc/sddm.conf.d
	sed 's/{{USER}}/$(USER)/g' autologin.conf.template | sudo tee /etc/sddm.conf.d/autologin.conf > /dev/null

enable:
	sudo systemctl enable sddm

link-session:
	sudo mkdir -p /usr/share/wayland-sessions
	sudo ln -sfnv $(shell pwd)/hyprland.desktop /usr/share/wayland-sessions/hyprland.desktop

packages:
	sudo pacman -S --needed --noconfirm sddm

install: packages create-configuration link-session enable

.PHONY: install create-configuration link-session packages enable
