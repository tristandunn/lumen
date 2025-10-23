link:
	ln -sfnv $(shell pwd) $(HOME)/.config/hypridle

packages:
	sudo pacman -S --needed --noconfirm hypridle
	yay -S --needed --noconfirm asdcontrol-git

install: packages link

.PHONY: install link packages
