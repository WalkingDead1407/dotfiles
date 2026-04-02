return {
	"xzbdmw/clasp.nvim",
	dependencies = {
		"jake-stewart/multicursor.nvim",
	},
	config = function()
		require("clasp").setup({
			pairs = {
				["{"] = "}",
				['"'] = '"',
				["'"] = "'",
				["("] = ")",
				["["] = "]",
				["<"] = ">",
				["`"] = "`",
			},
			-- Stay in insert mode when called from insert mode
			keep_insert_mode = true,
			-- Optional: Use aggressive pattern removal if needed
			-- remove_pattern = "[a-zA-Z_%-]+$",
			remove_pattern = nil,
		})

		-- Helper function to check if we should exit insert mode for multi-cursor
		local function should_exit_insert_for_multicursor()
			return vim.fn.mode() == "i"
				and package.loaded["multicursor-nvim"]
				and require("multicursor-nvim").numCursors() > 1
		end

		-- Forward wrapping (smallest to largest)
		-- Example progression: func(|) -> func(vim)| -> func(vim.keymap)| -> func(vim.keymap.foo('bar'))|
		vim.keymap.set({ "n", "i" }, "<c-;>", function()
			if should_exit_insert_for_multicursor() then
				vim.cmd("stopinsert")
			else
				require("clasp").wrap("next")
			end
		end, { desc = "Clasp: Wrap next (forward)" })

		-- Backward wrapping (largest to smallest)
		-- Example progression: func(|) -> func(vim.keymap.foo('bar'))| -> func(vim.keymap)| -> func(vim)|
		vim.keymap.set({ "n", "i" }, "<c-'>", function()
			if should_exit_insert_for_multicursor() then
				vim.cmd("stopinsert")
			else
				require("clasp").wrap("prev")
			end
		end, { desc = "Clasp: Wrap previous (backward)" })

		-- Undo in insert mode (in addition to normal mode 'u')
		vim.keymap.set("i", "<c-u>", "<cmd>undo<cr>", { desc = "Undo in insert mode" })

		-- Filter to only wrap nodes on current line
		vim.keymap.set({ "n", "i" }, "<c-;>", function()
			if should_exit_insert_for_multicursor() then
				vim.cmd("stopinsert")
			else
				require("clasp").wrap("next", function(nodes)
					local current_row = vim.api.nvim_win_get_cursor(0)[1] - 1
					local filtered = {}
					for _, node in ipairs(nodes) do
						if node.end_row == current_row then
							table.insert(filtered, node)
						end
					end
					return filtered
				end)
			end
		end, { desc = "Clasp: Wrap next (current line only)" })
	end,
}
