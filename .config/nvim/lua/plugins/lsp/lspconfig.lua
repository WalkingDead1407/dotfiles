return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- LSP Keymaps (triggered when LSP attaches to buffer)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

				opts.desc = "Signature help"
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			end,
		})

		-- Diagnostic configuration
		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}

		vim.diagnostic.config({
			title = false,
			underline = { severity = vim.diagnostic.severity.ERROR },
			virtual_text = true,
			signs = { text = signs },
			update_in_insert = false,
			severity_sort = true,
			float = {
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})

		-- Configure default settings for ALL servers
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- Server-specific configurations using vim.lsp.config
		vim.lsp.config("clangd", {
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=never",
				"--completion-style=detailed",
				"--function-arg-placeholders=true",
			},
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
		})

		vim.lsp.config("neocmake", {})

		vim.lsp.config("rust_analyzer", {
			cmd = { "rust-analyzer" },
			filetypes = { "rust" },
			settings = {
				["rust-analyzer"] = {
					checkOnSave = { command = "clippy" },
				},
			},
		})

		vim.lsp.config("pyright", {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})

		vim.lsp.config("asm_lsp", {})

		vim.lsp.config("bashls", {
			cmd = { "bash-language-server", "start" },
			filetypes = { "bash", "sh", "zsh" },
		})

		vim.lsp.config("html", {})

		vim.lsp.config("cssls", {})

		vim.lsp.config("tailwindcss", {})

		-- use denols (only) for deno projects
		vim.lsp.config("denols", {
			cmd = { "deno", "lsp" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			root_markers = { "deno.json", "deno.jsonc" },
			init_options = {
				enable = true,
				lint = true,
				unstable = true,
			},
		})

		-- Standard TS/JS for Node projects (package.json, tsconfig.json, etc.)
		vim.lsp.config("ts_ls", {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
		})

		vim.lsp.config("emmet_language_server", {
			filetypes = {
				"css",
				"html",
				"htmldjango",
				"vue",
			},
			init_options = {
				showAbbreviationSuggestions = true,
				showExpandedAbbreviation = "always",
				showSuggestionsAsSnippets = false,
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		vim.lsp.config("marksman", {})

		vim.lsp.config("jsonls", {})

		vim.lsp.config("hyprls", {})
		-- Mason-lspconfig automatically calls vim.lsp.enable() for installed servers
		-- No need to manually enable each server
	end,
}
