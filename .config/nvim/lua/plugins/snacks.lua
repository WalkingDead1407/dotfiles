return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,

		opts = {

			explorer = {
				enabled = false,
				layout = {
					cycle = false,
				},
			},
			---------------------------------------------------------------------------------------------------------
			quickfile = {
				enabled = true,
				exclude = { "latex" },
			},
			---------------------------------------------------------------------------------------------------------
			picker = {
				enabled = true,

				matchers = {
					frecency = true,
					cwd_bonus = true,
				},

				formatters = {
					file = {
						filename_first = false,
						filename_only = false,
						icon_width = 2,
					},
				},

				layout = {
					preset = "telescope",
					cycle = false,
				},

				layouts = {

					-- For telescope layout:
					telescope = {
						reverse = false,
						layout = {
							box = "horizontal",
							backdrop = false,
							width = 0.9,
							height = 0.9,
							border = "bold",
							{
								box = "vertical",
								{
									win = "input",
									height = 1,
									border = "rounded",
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
								{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
							},
							{
								win = "preview",
								title = "{preview:Preview}",
								width = 0.50,
								border = "rounded",
								title_pos = "center",
							},
						},
					},

					-- For select layout
					select = {
						preview = false,
						layout = {
							backdrop = false,
							width = 0.6,
							min_width = 80,
							height = 0.4,
							min_height = 10,
							box = "vertical",
							border = "rounded",
							title = "{title}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
						},
					},

					-- For ivy layout
					ivy = {
						layout = {
							box = "vertical",
							backdrop = false,
							width = 0,
							height = 0.4,
							position = "bottom",
							border = "top",
							title = " {title} {live} {flags}",
							title_pos = "left",
							{ win = "input", height = 1, border = "bottom" },
							{
								box = "horizontal",
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
							},
						},
					},

					-- Might configure some other layout later
				}, -- End of layouts
			}, -- End of picker
			---------------------------------------------------------------------------------------------------------
			indent = {
				enabled = true,
				priority = 1,
				only_scope = true,
				animate = {
					enabled = vim.fn.has("nvim-0.10") == 1,
					style = "out",
					easing = "linear",
					duration = { step = 30, total = 700 },
				},
			},

			---------------------------------------------------------------------------------------------------------
			dashboard = {
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
					{
						section = "terminal",
						cmd = "pokemon-colorscripts -r -s; sleep .1",
						random = 10,
						pane = 2,
						indent = 4,
						height = 30,
					},
				},
			},
			--------------------------------------------------------------------------------------------------------
			image = {
				enabled = true,
				doc = {
					enabled = true,
					inline = true,
					float = true,
					max_width = 60,
					max_height = 30,
				},
				img_dirs = {
					"img",
					"images",
					"assets",
					"static",
					"public",
					"media",
					"attachments",
				},
			},
			---------------------------------------------------------------------------------------------------------
		},
		-- End of opts
		keys = {
			-- For LazyGit & Git
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit Logs",
			},
			{
				"<leader>gd",
				function()
					require("snacks").picker.git_diff()
				end,
				desc = "Git diff (hunks)",
			},

			-- To Rename the current file
			{
				"<leader>R",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Fast Rename Current File",
			},
			-- To close the current buffer (if the file is not saved, asks to save)
			{
				"<leader>dB",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Close Buffer  (Confirm)",
			},

			-- For snack pickers (finders and shit)
			{
				"<leader>pf",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find files (snacks picker)",
			},
			{
				"<leader>pc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find nvim config files",
			},
			{
				"<leader>pw",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep something",
			},
			{
				"<leader>pvs",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Grep a visual selection (word or anything)",
				mode = { "n", "x" },
			},
			{
				"<leader>pk",
				function()
					require("snacks").picker.keymaps({ layout = "default" })
				end,
				desc = "Search keymaps",
			},
			{
				"<leader>p'",
				function()
					require("snacks").picker.registers()
				end,
				desc = "Search registers",
			},
			{
				"<leader>pm",
				function()
					require("snacks").picker.man({ layout = "vscode" })
				end,
				desc = "Search man pages",
			},
			-- Pick color schemes
			{
				"<leader>th",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
				desc = "Pick Color Schemes",
			},
			-- View help pages
			{
				"<leader>vh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Pages",
			},
			-- Pick and switch betwen git branches
			{
				"<leader>gbr",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Pick & witch git branches",
			},

			-- For indents
			{
				"<leader>io",
				function()
					require("snacks").indent.enable()
				end,
				desc = "Enable indentaion lines",
			},
			{
				"<leader>ic",
				function()
					require("snacks").indent.disable()
				end,
				desc = "Disable indentation lines",
			},
		},
	},

	-- TO/DO comments with snacks
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		optional = true,
		keys = {
			{
				"<leader>pt",
				function()
					require("snacks").picker.todo_comments()
				end,
				desc = "Look through ToDo comments",
			},
			{
				"<leader>pT",
				function()
					require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
		},
	},
}
