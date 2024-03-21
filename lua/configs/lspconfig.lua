local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
	-- web dev stuff
	"cssls",
	"html",
	"tsserver",
	"jsonls",

	-- c/cpp stuff
	"clangd",
	"lemminx",

	-- rust
	"rust_analyzer",
	"taplo",
	"wgsl_analyzer",

	-- python
	"pyright",

	-- docker
	"bashls",
	"docker_compose_language_service",
	"dockerls",
	"nil_ls",
	"yamlls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- Example custom setup for one server
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
