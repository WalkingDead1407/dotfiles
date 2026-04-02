return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
	opts = {
		defaults = {
			insert_mode_after_paste = true,
			url_encode_path = true,
			template = "$FILE_PATH",
			use_cursor_in_template = true,

			prompt_for_file_name = true,
			show_dir_path_in_prompt = true,

			use_absolute_path = false,
			relative_to_current_file = true,

			embed_image_as_base64 = false,
			max_base64_size = 10,

			copy_images = true,
			download_images = true,

			drag_and_drop = {
				enabled = true,
				insert_mode = true,
			},
		},
	},
}
