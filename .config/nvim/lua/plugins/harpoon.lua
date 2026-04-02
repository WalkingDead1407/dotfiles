-- <leader>ha       Add file to harpoon
-- <leader>hl       Toggle harpoon quick menu

-- <leader>1, <leader>2, .., <leader>4      Select file from harpoon list
-- <leader>d1, <leader>d2, .., <leader>d4   Remove file from harpoon list
return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		opts = {
			settings = {
				sync_on_ui_close = true,
			},
		},
		keys = function()
			local keys = {
				{
					"<leader>ha",
					function()
						require("harpoon"):list():add()
					end,
					desc = "Add file to harpoon",
				},
				{
					"<leader>hl",
					function()
						require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
					end,
					desc = "Harpoon quick menu",
				},
			}

			for i = 1, 4 do
				table.insert(keys, {
					"<leader>" .. i,
					function()
						require("harpoon"):list():select(i)
					end,
					desc = "Harpoon to File " .. i,
				})
				table.insert(keys, {
					"<leader>d" .. i,
					function()
						local l = require("harpoon"):list():length()
						require("harpoon"):list():remove_at(i)
						for j = i + 1, l do
							local item = require("harpoon"):list():get(j)
							require("harpoon"):list():replace_at(j - 1, item)
						end
					end,
					desc = "Harpoon Remove File " .. i,
				})
			end
			return keys
		end,
	},

	{
		"kiennt63/harpoon-files.nvim",
		dependencies = {
			{ "ThePrimeagen/harpoon", branch = "harpoon2" },
		},
	},
}
