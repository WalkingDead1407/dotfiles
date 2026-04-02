return {

    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()
        require("oil").setup({

            default_file_explorer = true,

            columns = {
                "icons",
                "permisions",
                "size",
                "mtime",
            },

            win_options = {
                wrap = false,
                signcolumn = "no",
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
            },

            view_options = {
                show_hidden = true,
            },

            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,

            keymaps = {
                ["g?"] = { "actions.show_help", mode = "n" },

                ["<CR>"] = "actions.select",

                ["<C-s>"] = false,
                ["<C-h>"] = false,

                ["<C-t>"] = { "actions.select", opts = { tab = true } },

                ["<C-p>"] = "actions.preview",

                ["q"] = { "actions.close", mode = "n" },

                ["<C-r>"] = "actions.refresh",

                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },

                ["`"] = { "actions.cd", mode = "n" },

                ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },

                ["gs"] = { "actions.change_sort", mode = "n" },

                ["gx"] = "actions.open_external",

                ["g."] = { "actions.toggle_hidden", mode = "n" },

                ["g\\"] = { "actions.toggle_trash", mode = "n" },
            },

        })
        -- Keymaps for oil
        vim.keymap.set("n", "-", "<cmd>Oil<CR>", {desc = "Open parent directory using oil"})
        vim.keymap.set("n", "<leader>-", "<cmd>Oil --float<CR>", {desc = "Open parent directory using oil (floating)"})

        -- Highlight the line at which the cursor is (for the oil)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil", -- Adjust if Oil uses a specific file type identifier
            callback = function()
                vim.opt_local.cursorline = true
        end,
    })

    end

}
