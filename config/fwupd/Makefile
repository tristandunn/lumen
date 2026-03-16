install: packages configure

packages:
	sudo pacman -S --needed --noconfirm fwupd udisks2

configure:
	sudo sed -i 's/^ReportURI=/# ReportURI=/' /etc/fwupd/remotes.d/lvfs.conf

.PHONY: install packages configure
