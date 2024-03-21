-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {
	base46 = {
		theme = "gruvchad",
		-- hl_override = {
		-- 	Comment = { italic = true },
		-- 	["@comment"] = { italic = true },
		-- },
	},
	nvdash = {
		load_on_startup = true,
	},
	mason = {
		pkgs = {
			-- lua stuff
			"lua-language-server",
			"stylua",

			-- web dev stuff
			"css-lsp",
			"html-lsp",
			"typescript-language-server",
			"json-lsp",
			"prettier",

			-- c/cpp stuff
			"clangd",
			"clang-format",
			"lemminx",

			-- rust
			"rust-analyzer",
			"taplo",
			"wgsl-analyzer",

			-- python
			"pyright",

			-- docker
			"bash-language-server",
			"docker-compose-language-service",
			"dockerfile-language-server",
			"yaml-language-server",
		},
	},
}
-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
