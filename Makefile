.PHONY: install update backup clean help

help:
	@echo "Dotfiles Makefile"
	@echo "================"
	@echo "make install   - Install dotfiles (creates symlinks)"
	@echo "make update    - Update dotfiles from repo"
	@echo "make backup    - Backup current configs"
	@echo "make clean     - Remove symlinks"
	@echo "make help      - Show this help"

install:
	@bash install.sh

update:
	@echo "Pulling latest changes..."
	@git pull origin main
	@echo "Updated!"

backup:
	@mkdir -p backups
	@cp -r ~/.bashrc ~/.profile ~/.config/btop ~/.config/kitty ~/.config/nvim ~/.config/pokemon-fetch ~/.config/lazygit backups/ 2>/dev/null || true
	@echo "Backup created in ./backups/"

clean:
	@echo "Removing symlinks..."
	@rm -f ~/.bashrc ~/.profile
	@rm -rf ~/.config/btop ~/.config/kitty ~/.config/nvim ~/.config/pokemon-fetch ~/.config/lazygit
	@echo "Symlinks removed"

.DEFAULT_GOAL := help
