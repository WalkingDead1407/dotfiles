return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		auto_jump = true,
		-- open_no_results = true,
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Open trouble workspace diagnostics",
		},
		-- for current buffer
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Open trouble document diagnostics",
		},
		{
			"<leader>xt",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Open to-dos in trouble",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Open trouble location list",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Open trouble quickfix list",
		},
		-- {
		--   "<leader>Xcl",
		--   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		--   desc = "LSP Definitions / references / ... (Trouble)",
		-- },
	},
}
