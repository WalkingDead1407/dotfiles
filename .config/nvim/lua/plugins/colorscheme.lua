return {
	-- NOTE: Rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				dim_inactive_windows = false,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					ColorColumn = { bg = "#1C1C21" },
					Normal = { bg = "none" },
					Pmenu = { bg = "", fg = "#e0def4" },
					PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" },
					PmenuSbar = { bg = "#191724" },
					PmenuThumb = { bg = "#9ccfd8" },
					-- Rainbow delimiters
					RainbowDelimiterRed = { fg = "#eb6f92" },
					RainbowDelimiterYellow = { fg = "#f6c177" },
					RainbowDelimiterBlue = { fg = "#9ccfd8" },
					RainbowDelimiterOrange = { fg = "#ea9a97" },
					RainbowDelimiterGreen = { fg = "#9ccfd8" },
					RainbowDelimiterViolet = { fg = "#c4a7e7" },
					RainbowDelimiterCyan = { fg = "#9ccfd8" },
				},
				enable = {
					terminal = false,
					legacy_highlights = false,
					migrations = true,
				},
			})
		end,
	},
	-- NOTE: gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					folds = false,
					operators = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true,
				contrast = "",
				palette_overrides = {},
				overrides = {
					Pmenu = { bg = "" },
					-- Rainbow delimiters (NEW FORMAT)
					RainbowDelimiterRed = { fg = "#cc241d" },
					RainbowDelimiterYellow = { fg = "#d79921" },
					RainbowDelimiterBlue = { fg = "#458588" },
					RainbowDelimiterOrange = { fg = "#d65d0e" },
					RainbowDelimiterGreen = { fg = "#689d6a" },
					RainbowDelimiterViolet = { fg = "#b16286" },
					RainbowDelimiterCyan = { fg = "#689d6a" },
				},
				dim_inactive = false,
				transparent_mode = true,
			})
		end,
	},
	-- NOTE: Kanagawa
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				colors = {
					palette = {},
					theme = {
						wave = {},
						dragon = {},
						all = {
							ui = {
								bg_gutter = "none",
								border = "rounded",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						Pmenu = { fg = theme.ui.shade0, bg = "NONE", blend = vim.o.pumblend },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptBorder = { fg = theme.ui.special },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim },
						TelescopeResultsBorder = { fg = theme.ui.special },
						TelescopePreviewBorder = { fg = theme.ui.special },
						-- Rainbow delimiters
						RainbowDelimiterRed = { fg = colors.palette.peachRed },
						RainbowDelimiterYellow = { fg = colors.palette.carpYellow },
						RainbowDelimiterBlue = { fg = colors.palette.dragonBlue },
						RainbowDelimiterOrange = { fg = colors.palette.surimiOrange },
						RainbowDelimiterGreen = { fg = colors.palette.springGreen },
						RainbowDelimiterViolet = { fg = colors.palette.oniViolet },
						RainbowDelimiterCyan = { fg = colors.palette.waveAqua1 },
					}
				end,
				theme = "wave",
				background = {
					dark = "wave",
				},
			})
		end,
	},
	-- NOTE: neosolarized
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = false },
					functions = {},
					variables = {},
					sidebars = "dark",
					floats = "dark",
				},
				sidebars = { "qf", "help" },
				day_brightness = 0.3,
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = false,
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = c.bg_dark,
					}
					hl.TelescopePromptBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = "#2C94DD",
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					-- Rainbow delimiters
					hl.RainbowDelimiterRed = { fg = c.red }
					hl.RainbowDelimiterYellow = { fg = c.yellow }
					hl.RainbowDelimiterBlue = { fg = c.blue }
					hl.RainbowDelimiterOrange = { fg = c.orange }
					hl.RainbowDelimiterGreen = { fg = c.green }
					hl.RainbowDelimiterViolet = { fg = c.magenta }
					hl.RainbowDelimiterCyan = { fg = c.cyan }
				end,
			})
		end,
	},
	-- NOTE : tokyonight
	{
		"folke/tokyonight.nvim",
		name = "folkeTokyonight",
		config = function()
			local transparent = true
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
				on_colors = function(colors)
					colors.bg = transparent and colors.none or bg
					colors.bg_dark = transparent and colors.none or bg_dark
					colors.bg_float = transparent and colors.none or bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = transparent and colors.none or bg_dark
					colors.bg_statusline = transparent and colors.none or bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
				on_highlights = function(hl, c)
					-- Rainbow delimiters
					hl.RainbowDelimiterRed = { fg = c.red }
					hl.RainbowDelimiterYellow = { fg = c.yellow }
					hl.RainbowDelimiterBlue = { fg = c.blue }
					hl.RainbowDelimiterOrange = { fg = c.orange }
					hl.RainbowDelimiterGreen = { fg = c.green }
					hl.RainbowDelimiterViolet = { fg = c.magenta }
					hl.RainbowDelimiterCyan = { fg = c.cyan }
				end,
			})
			-- NOTE: Auto switch to tokyonight for markdown files only
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown" },
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					if not vim.b[buffer].tokyonight_applied then
						if vim.fn.expand("%:t") ~= "" and vim.api.nvim_buf_get_option(0, "buftype") ~= "nofile" then
							vim.cmd("colorscheme tokyonight")
						end
						vim.b[buffer].tokyonight_applied = true
					end
				end,
			})
		end,
	},
}
