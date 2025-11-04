install:
	make -C config/yay install
	make -C config/hypr install
	make -C config/elephant install
	make -C config/hypridle install
	make -C config/hyprlock install
	make -C config/kitty install
	make -C config/sddm install
	make -C config/walker install
	make -C config/git install
	make -C config/zsh install

.PHONY: install
