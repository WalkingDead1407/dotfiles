return {

	{ "echasnovski/mini.nvim", version = false },

	-- MiniFiles file explorer
	{
		"echasnovski/mini.files",
		config = function()
			local MiniFiles = require("mini.files")

			local show_dotfiles = false

			local filter_hide = function(entry)
				return not vim.startswith(entry.name, ".")
			end

			local filter_show = function(_)
				return true
			end

			MiniFiles.setup({
				mappings = {
					close = "q",
					go_in = "<CR>",
					go_out = "-",
					reveal_cwd = "@",
				},
				options = {
					permanent_delete = false,
					use_as_default_explorer = false,
				},
				content = {
					filter = filter_hide,
				},
			})

			-- Keymaps for minifiles
			vim.keymap.set("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open MiniFiles explorer" })

			vim.keymap.set("n", "<leader>E", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end, { desc = "Open MiniFiles explorer into currently opened file" })

			vim.keymap.set("n", "<leader>H", function()
				show_dotfiles = not show_dotfiles
				MiniFiles.refresh({
					content = {
						filter = show_dotfiles and filter_show or filter_hide,
					},
				})
			end, { desc = "Toggle hidden files" })
		end,
	},

	-- MiniComment for comments
	{
		"echasnovski/mini.comment",
		version = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			-- disable the autocommand from ts-context-commentstring
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			require("mini.comment").setup({
				-- tsx, jsx, html , svelte comment support
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring.internal").calculate_commentstring({
							key = "commentstring",
						}) or vim.bo.commentstring
					end,
				},
			})
		end,
	},

	-- Mini Trailspace
	{
		"echasnovski/mini.trailspace",
		event = "VeryLazy",
		config = function()
			local MiniTrailSpace = require("mini.trailspace")

			MiniTrailSpace.setup({
				only_in_normal_buffers = true,
			})

			-- Keymap to manually trim whitespace from the file
			vim.keymap.set("n", "<leader>ts", function()
				-- The `trim()` function also removes the highlight after cleaning
				MiniTrailSpace.trim()
				print("Trailing whitespace trimmed.")
			end, { desc = "[T]rim Trail[s]pace" })

			-- Keymap to manually clear the highlight without trimming
			vim.keymap.set("n", "<leader>tc", function()
				MiniTrailSpace.unhighlight()
				print("Trailing whitespace highlight cleared.")
			end, { desc = "[T]rim [C]lear Highlight" })

			-- Autocommand to automatically clear the highlight when in insert mode
			vim.api.nvim_create_autocmd("InsertEnter", {
				pattern = "*",
				callback = function()
					MiniTrailSpace.unhighlight()
				end,
				desc = "Clear trailing whitespace highlight on entering insert mode.",
			})
		end,
	},
}
