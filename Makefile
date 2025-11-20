install:
	make -C config/yay install
	make -C config/keyd install
	make -C config/hypr install
	make -C config/elephant install
	make -C config/firefox install
	make -C config/git install
	make -C config/hypridle install
	make -C config/hyprlock install
	make -C config/kitty install
	make -C config/nvim install
	make -C config/openssh install
	make -C config/ripgrep install
	make -C config/tmux install
	make -C config/sddm install
	make -C config/walker install
	make -C config/zsh install
	make -C config/steam install
	make -C config/swayosd install
	make -C config/mise install

.PHONY: install
