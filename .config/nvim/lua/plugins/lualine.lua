return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local harpoon_files = require("harpoon_files")

		local colors = {
			black = "#092236",
			pink = "#ff5874",
			white = "#c3ccdc",
			dark_grey = "#1c1e26",
			grey = "#a1aab8",
			medium_grey = "#828697",
			purple = "#ae81ff",
		}

		local lualine_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.pink, gui = "bold" },
				b = { fg = colors.white, bg = colors.dark_grey },
				c = { fg = colors.white, bg = colors.dark_grey },
			},
			insert = { a = { fg = colors.black, bg = colors.white, gui = "bold" } },
			visual = { a = { fg = colors.black, bg = colors.purple, gui = "bold" } },
			replace = { a = { fg = colors.black, bg = colors.medium_grey, gui = "bold" } },
			inactive = {
				a = { fg = colors.grey, bg = colors.dark_grey, gui = "bold" },
				b = { fg = colors.grey, bg = colors.dark_grey },
				c = { fg = colors.grey, bg = colors.dark_grey },
			},
		}

		local selection_count = {
			function()
				local mode = vim.fn.mode()
				if mode ~= "v" and mode ~= "V" then
					return ""
				end
				local start_line = vim.fn.line("v")
				local end_line = vim.fn.line(".")
				local lines = math.abs(end_line - start_line) + 1
				return " " .. lines .. "L"
			end,
			color = { fg = colors.purple },
		}

		lualine.setup({
			options = {
				theme = lualine_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { statusline = { "NvimTree" } },
				icons_enabled = true,
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename", {harpoon_files.lualine_component} },
				lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
				lualine_y = { "progress", selection_count },
				lualine_z = {
					"location",
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_d = { harpoon_files.lualine_component },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
