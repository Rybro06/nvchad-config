require("nvchad.mappings")

-- General Keymap Changes
-- shortcuts
vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "General Quit Vim Window" })
vim.keymap.set("n", ";", ":", { desc = "General Enter command mode" })

-- cursor stability
vim.keymap.set("n", "J", "mzJ`z", { desc = "General Join lines" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "General Half page up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "General Half page down" })
vim.keymap.set("n", "n", "nzzzv", { desc = "General Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "General Previous search result" })

-- whitespace toggle
vim.keymap.set("n", "<leader>ts", "<Cmd>set list!<CR>", { desc = "General Toggle whitespace visibility" })

-- shift selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "General Shift selection down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "General Shift selection down" })

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Focus Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Focus Move focus to the upper window" })

-- LSP code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
