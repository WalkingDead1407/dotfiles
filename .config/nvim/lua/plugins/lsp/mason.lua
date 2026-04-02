return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Setup Mason first
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Setup mason-lspconfig with automatic_enable
		-- This will automatically call vim.lsp.enable() for installed servers
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"neocmake",
				"rust_analyzer",
				"pyright",
				"bashls",
				"html",
				"cssls",
                "ts_ls",
				"tailwindcss",
				"emmet_language_server",
				"lua_ls",
				"jsonls",
                "hyprls",
			},
			automatic_enable = true,
		})

		-- Setup non-LSP tools
		require("mason-tool-installer").setup({
			ensure_installed = {
				"codelldb",
				"debugpy",
				"bash-debug-adapter",
				"prettier",
				"asmfmt",
				"stylua",
				"black",
			},
		})
	end,
}
