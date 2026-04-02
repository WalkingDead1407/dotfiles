return {

	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = { "hrsh7th/nvim-cmp" },

	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		})

		-- import the nvim-autopairs completion functionality
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- import the nvim-cmp plugin (actual completions plugin)
		local cmp = require("cmp")

		-- make autopairs and cmp work torgether
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
