return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Fugitive: Open Git Status" })

			local myFugitive = vim.api.nvim_create_augroup("myFugitive", { clear = true })

			vim.api.nvim_create_autocmd("BufWinEnter", {
				group = myFugitive,
				pattern = "*",
				callback = function()
					if vim.bo.ft ~= "fugitive" then
						return
					end

					local bufnr = vim.api.nvim_get_current_buf()
					local opts = { buffer = bufnr, remap = false }

					vim.keymap.set("n", "<leader>P", function()
						vim.cmd.Git("push")
					end, { desc = "Fugitive: [P]ush", buffer = bufnr })

					vim.keymap.set("n", "<leader>p", function()
						vim.cmd.Git({ "pull", "--rebase" })
					end, { desc = "Fugitive: [p]ull with rebase", buffer = bufnr })

					vim.keymap.set(
						"n",
						"<leader>t",
						":Git push -u origin ",
						{ desc = "Fugitive: Se[t] upstream", buffer = bufnr }
					)
				end,
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- Actions
				map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")

				map("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")

				map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")

				map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
				map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")

				-- map("n", "<leader>gbl", function()
				-- 	gs.blame_line({ full = true })
				-- end, "Blame line")

				map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
				map("n", "<leader>gd", gs.diffthis, "Diff this")

				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, "Diff this ~")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
			end,
		},
	},

	{
		"ThePrimeagen/git-worktree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},

		config = function()
			local gwt = require("git-worktree")

			gwt.setup()

			require("telescope").load_extension("git_worktree")

			-- HACK: by default
			-- <Enter> - switches to that worktree
			-- <c-d> - deletes that worktree
			-- <c-f> - toggles forcing of the next deletion

			-- Create new worktree
			vim.keymap.set("n", "<leader>gwt", function()
				require("telescope").extensions.git_worktree.git_worktrees()
			end, { desc = "list Git Worktree" })

			-- Switch/list worktrees
			vim.keymap.set("n", "<leader>gwc", function()
				require("telescope").extensions.git_worktree.create_git_worktree()
			end, { desc = "Create Git Worktree Branches" })
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nim-lua/plenary.nvim" },
		enabled = false,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
