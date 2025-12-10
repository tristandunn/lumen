install: link apply

link:
	sudo ln -sfnv $(shell pwd)/99-network.conf /etc/sysctl.d/99-network.conf

apply:
	sudo sysctl --system

.PHONY: install link apply
