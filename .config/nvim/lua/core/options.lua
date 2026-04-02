local opt = vim.opt

vim.cmd("let g:netrw_banner = 0")
vim.cmd("syntax on")

-- For line number
opt.number = true
opt.relativenumber = true

-- For clipboard
vim.opt.clipboard = "unnamedplus"

-- For indentation & stuff like that
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.backspace = { "start", "eol", "indent" }

-- For searching & highlighting
opt.incsearch = true
opt.inccommand = "split"
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
vim.cmd([[highlight LineNr term=underline ctermfg=12 guifg=blue]])

-- For backups & swaps
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- UI Stuff
opt.wrap = true
opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true

opt.updatetime = 50
opt.mouse = "a"
vim.g.editorconfig = true
