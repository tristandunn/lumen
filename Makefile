install:
	make -C config/yay install
	make -C config/pacman install
	make -C config/pipewire install
	make -C config/bluetooth install
	make -C config/keyd install
	make -C config/hypr install
	make -C config/elephant install
	make -C config/claude install
	make -C config/docker install
	make -C config/firefox install
	make -C config/git install
	make -C config/hypridle install
	make -C config/hyprpaper install
	make -C config/hyprlock install
	make -C config/iwd install
	make -C config/kitty install
	make -C config/mise install
	make -C config/nautilus install
	make -C config/nvim install
	make -C config/openssh install
	make -C config/ripgrep install
	make -C config/tmux install
	make -C config/sddm install
	make -C config/steam install
	make -C config/swayosd install
	make -C config/sysctl install
	make -C config/voxtype install
	make -C config/walker install
	make -C config/waybar install
	make -C config/scripts install
	make -C config/zsh install

.PHONY: install
