local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.timeout = true
vim.o.timeoutlen = 1300

-----------------------------------------------------
--------------- General Stuff -----------------------
-----------------------------------------------------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves lines up in visual selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join the current line with the one below it" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "<ove up in buffer with cursor centered" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next match, center it on screen and ensure its visible if folded" })
vim.keymap.set(
	"n",
	"N",
	"Nzzzv",
	{ desc = "Move to previous match, center it on screen and ensure its visible if folded" }
)

vim.keymap.set("n", "<leader>C", ":nohl<CR>", { desc = "Clear search hl", silent = true })

vim.keymap.set("v", "<", "<gv", { desc = "Indent selection to left and keep selection", noremap = true, silent = true })
vim.keymap.set(
	"v",
	">",
	">gv",
	{ desc = "Indent selection to right and keep selection", noremap = true, silent = true }
)

-- format without prettier, using the built in shit
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })

-- Replace the word that the cursor is on globally
vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace the current word globally" }
)

-- Makes the current file executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>")

-- Executes a shell script directly from nvim (make it executable and execute it)
vim.keymap.set("n", "<leader>XX", "<cmd>!chmod +x % && ./%<CR>")

-- Build the project in the build directory
vim.keymap.set("n", "<leader>mk", "<cmd>!cd build && make clean && make<CR>")

-- Build the project and run tests in build directory
vim.keymap.set("n", "<leader>rt", "<cmd>!cd build && make clean && make && ctest<CR>")

-- Copy file path to the clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy the path of the file in the clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
	vim.diagnostic.config({
		virtual_text = isLspDiagnosticsVisible,
		underline = isLspDiagnosticsVisible,
	})
end, { desc = "Toggle LSP diagnostics" })

-- Dismiss all notification windows currently displayed
vim.keymap.set("n", "<leader>cn", function()
	require("notify").dismiss({ silent = false, pending = false })
end, { noremap = true, desc = "Clear notification" })

-- Alias for suda.vim plugin
vim.cmd([[cnoreabbrev W SudaWrite]])
-----------------------------------------------------
-------------- Clipboard Stuff ----------------------
-----------------------------------------------------
-- Paste without replacing the stuff in clipboard
vim.keymap.set("x", "<leader>P", [["_dp]])

-- Remember clipboard after selecting and pasting (no cooy of new shit)
vim.keymap.set("v", "p", '"_dp', opts)

-- Dont store the character into the clipboard when deleted using x
vim.keymap.set("n", "x", '"_x', opts)

-- Dont remember the deleted text when deleted using leader+d
vim.keymap.set({ "n", "v" }, "<leader>Ds", [["_d]])

-- Same as above but for a whole line
vim.keymap.set({ "n", "v" }, "<leader>Dl", [["_dd]])

-----------------------------------------------------
----------------- Tab Stuff -------------------------
-----------------------------------------------------
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open a new tab" })
vim.keymap.set("n", "<leader>tO", "<cmd>tabnew %<CR>", { desc = "Open current tab in a new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close a tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Move to previous tab" })

-----------------------------------------------------
-------------- Autocommands Stuff -------------------
-----------------------------------------------------
-- Higlight what was yanked
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking stuff",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-----------------------------------------------------
----------------- splits Stuff ----------------------
-----------------------------------------------------
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
