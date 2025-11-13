return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"c",
				"markdown",
				"markdown_inline",
				"rust",
				"dart",
				"toml",
				"python",
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		opts = {
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "cmp_tabnine" },
				{ name = "buffer" },
				{ name = "luasnip" },
			},
			mapping = {
				-- disable  tab
				["<Tab>"] = function(callback)
					callback()
				end,

				["<S-Tab>"] = function(callback)
					callback()
				end,

				-- use Up and down for cycling completion
				["<Down>"] = require("cmp").mapping(function(fallback)
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<Up>"] = require("cmp").mapping(function(fallback)
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},
		},
		dependencies = {
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
				config = function()
					local tabnine = require("cmp_tabnine.config")
					tabnine:setup({})
				end,
			},
		},
	},

	{
		"jinh0/eyeliner.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = true,
			})
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},

	{ -- Collection of various small independent plugins/modules
		event = "VimEnter",
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},

	{
		"tpope/vim-sleuth",
		event = { "BufReadPost", "BufNewFile" },
	},

	-- test new blink
	-- { import = "nvchad.blink.lazyspec" },

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
