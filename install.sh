#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "================================================"
echo "Installing dotfiles from: $DOTFILES_DIR"
echo "================================================"

mkdir -p "$BACKUP_DIR"
echo "📦 Backup directory created: $BACKUP_DIR"
echo ""

create_symlink() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "⚠️  Backing up existing $dest"
        mkdir -p "$(dirname "$BACKUP_DIR/${dest##*/}")"
        mv "$dest" "$BACKUP_DIR/" 2>/dev/null || true
    fi
    
    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
    echo "✅ Linked $dest"
}

echo "Creating symlinks for shell configs..."
[ -f "$DOTFILES_DIR/.bashrc" ] && create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
[ -f "$DOTFILES_DIR/.profile" ] && create_symlink "$DOTFILES_DIR/.profile" "$HOME/.profile"

echo ""
echo "Creating symlinks for application configs..."
[ -d "$DOTFILES_DIR/.config/btop" ] && create_symlink "$DOTFILES_DIR/.config/btop" "$HOME/.config/btop"
[ -d "$DOTFILES_DIR/.config/kitty" ] && create_symlink "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
[ -d "$DOTFILES_DIR/.config/nvim" ] && create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
[ -d "$DOTFILES_DIR/.config/pokemon-fetch" ] && create_symlink "$DOTFILES_DIR/.config/pokemon-fetch" "$HOME/.config/pokemon-fetch"
[ -d "$DOTFILES_DIR/.config/lazygit" ] && create_symlink "$DOTFILES_DIR/.config/lazygit" "$HOME/.config/lazygit"

echo ""
echo "================================================"
echo "✨ Dotfiles installed!"
echo "================================================"
