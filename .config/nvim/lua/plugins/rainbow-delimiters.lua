-- File: ~/.config/nvim/lua/plugins/rainbow-delimiters.lua
return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		require("rainbow-delimiters.setup").setup({
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
			},
			query = {
				[""] = "rainbow-delimiters",
			},
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		})

		-- Function to set rainbow colors
		local function set_rainbow_colors()
			vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#cc241d" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#d79921" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#458588" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#d65d0e" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#689d6a" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#b16286" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#8ec07c" })
		end

		-- Apply colors immediately
		set_rainbow_colors()

		-- Re-apply colors after colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				-- Small delay to ensure colorscheme is fully loaded
				vim.defer_fn(set_rainbow_colors, 10)
			end,
		})
	end,
}
