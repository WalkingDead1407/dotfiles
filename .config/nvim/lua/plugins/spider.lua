return {
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		dependencies = { "chrisgrieser/nvim-spider" },
		keys = {
			{ "<leader>tM", "<cmd>Precognition toggle<CR>", mode = { "n" } },
			{ "<leader>tm", "<cmd>Precognition peek<CR>", mode = { "n" } },
		},
		opts = {
			startVisible = false,
			showBlankVirtLine = true,
		},
	},
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		keys = {
			{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
			{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
			{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
		},
	},
}
