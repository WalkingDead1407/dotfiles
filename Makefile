.PHONY: install help

help:
	@echo "Dotfiles Management"
	@echo "make install - Install dotfiles"

install:
	@bash install.sh

.DEFAULT_GOAL := help
