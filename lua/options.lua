require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local is_git_bash = is_windows and vim.o.shell:find("bash(.exe)?$") ~= nil
local home = os.getenv((is_windows and not is_git_bash) and "HOMEPATH" or "HOME")
if is_git_bash then
	-- fix the shell path on git bash for windows
	autocmd("VimEnter", { pattern = "*", command = "let &shell = '\"C:/Program Files/Git/bin/bash.exe\"'" })
	autocmd("VimEnter", { pattern = "*", command = "let &shellcmdflag = '-c'" })
end

-- Vim settings
vim.g.have_nerd_font = true
vim.opt.cursorline = true

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indetation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.g.rust_recommended_style = false

-- show whitespace
vim.opt.list = true
vim.opt.showbreak = "↪\\"
vim.opt.listchars = "eol:,tab: ,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:·"

-- wrapping
vim.opt.wrap = false
vim.opt.colorcolumn = "120"

-- history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- misc
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- file types
vim.api.nvim_command([[autocmd BufNewFile,BufRead *.wgsl setfiletype wgsl]])
vim.api.nvim_command([[autocmd BufNewFile,BufRead *.mxe setfiletype xml]])

-- Highlight when yanking text
autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
