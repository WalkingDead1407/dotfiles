return {
	"eero-lehtinen/oklch-color-picker.nvim",
	event = "VeryLazy",

	keys = {
		{
			"<A-c>",
			function()
				require("oklch-color-picker").pick_under_cursor({ fallback_open = {} })
			end,
			desc = "Pick and edit color under cursor",
		},
		{
			"<C-c>",
			function()
				require("oklch-color-picker").open_picker()
			end,
			desc = "Open color picker for new color",
		},
		{
			"<leader>cc",
			function()
				require("oklch-color-picker").highlight.toggle()
			end,
			desc = "Toggle color highlighter",
		},
	},

	opts = {
		highlight = {
			enabled = true,

			style = "foreground+virtual_left",
            virtual_text = " ",
			bold = true,
			italic = true,

			emphasis = {
				threshold = { 0.1, 0.17 },
				amount = { 45, -80 },
			},

			edit_delay = 60,
			scroll_delay = 0,
		},
	},
}
