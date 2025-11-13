-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
	-- web dev stuff
	"cssls",
	"html",
	"ts_ls",
	"jsonls",
	"sqlls",

	-- c/cpp stuff
	"clangd",
	"lemminx",

	-- rust
	"rust_analyzer",
	"taplo",
	"wgsl_analyzer",

	-- python
	"basedpyright",

	-- docker
	"bashls",
	"docker_compose_language_service",
	"dockerls",
	"nil_ls",
	"yamlls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
