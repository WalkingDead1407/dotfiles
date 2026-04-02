return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter.configs")
		ts.setup({
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			ensure_installed = {
				"c",
				"cpp",
				"rust",
				"go",
				"python",
				"css",
				"javascript",
				"html",
				"lua",
				"vim",
				"markdown",
				"markdown_inline",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
				},
			},
			additional_vim_regex_highlighting = false,
		})
	end,
}
