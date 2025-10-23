install:
	make -C config/elephant install
	make -C config/hypr install
	make -C config/kitty install
	make -C config/walker install

.PHONY: install
