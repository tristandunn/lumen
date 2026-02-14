install: packages models

models:
	mkdir -p $(HOME)/.local/share/piper
	python -m piper.download_voices en_US-amy-medium --download-dir $(HOME)/.local/share/piper

packages:
	yay -S --needed --noconfirm piper-tts

.PHONY: install models packages
