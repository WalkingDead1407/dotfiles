vim.opt.termguicolors = true
require("core.options")
require("core.keymaps")
require("lazy_setup")
require("current-theme")
require('lazy').setup {
  require 'plugins.neotree',
  require 'plugins.colortheme',
}

vim.cmd("colorscheme oxocarbon")

-- transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- neo-tree
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
