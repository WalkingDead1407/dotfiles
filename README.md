# My Dotfiles

Personal dotfile configurations for btop, kitty, nvim, pokemon-fetch, lazygit, and bash.

## 📸 Screenshots

Add screenshots here! Create `screenshots/` folder and add:
- `screenshots/btop.png`
- `screenshots/kitty.png`
- `screenshots/nvim.png`
- `screenshots/pokemon-fetch.png`
- `screenshots/lazygit.png`

```markdown
### Btop - System Monitor
![Btop Screenshot](./screenshots/btop.png)

### Kitty Terminal
![Kitty Terminal](./screenshots/kitty.png)

### Neovim Setup
![Neovim Setup](./screenshots/nvim.png)

### Pokemon-fetch System Info
![Pokemon-fetch](./screenshots/pokemon-fetch.png)

### Lazygit Git Interface
![Lazygit](./screenshots/lazygit.png)
```

## 📦 Installation

### Prerequisites

Install required tools:

**macOS:**
```bash
brew install btop kitty neovim lazygit
pip3 install pokemon-fetch
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install -y btop kitty neovim lazygit
pip3 install pokemon-fetch
```

### Setup

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
source ~/.bashrc
```

## 📁 Repository Structure

```
dotfiles/
├── .bashrc                    # Bash configuration
├── .profile                   # Shell profile
├── .config/
│   ├── btop/btoprc           # System monitor config
│   ├── kitty/kitty.conf      # Terminal emulator config
│   ├── nvim/init.lua         # Neovim config
│   ├── pokemon-fetch/config.json
│   └── lazygit/config.yml
├── screenshots/              # Screenshots for README
├── install.sh                # Installation script
├── Makefile                  # Make targets
├── README.md                 # This file
└── .gitignore                # Git ignore rules
```

## 🔧 Usage

### Install
```bash
./install.sh
```

### Using Make
```bash
make install      # Install dotfiles
make help         # Show commands
```

## 📝 Customization

Fork this repository and customize for your needs!

```bash
# Make changes
vim ~/.config/nvim/init.lua

# Commit
cd ~/dotfiles
git add .
git commit -m "Update nvim config"
git push origin main
```

## 📄 License

Free to use and customize!

---

**Enjoy your dotfiles!** 🎉
