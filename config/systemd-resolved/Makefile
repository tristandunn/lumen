install: link service

link:
	sudo install -Dm 644 resolved.conf /etc/systemd/resolved.conf.d/cloudflare.conf
	sudo ln -sfnv /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

service:
	sudo systemctl enable --now systemd-resolved
	sudo systemctl restart systemd-resolved

.PHONY: install link service
