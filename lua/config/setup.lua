require("lualine").setup()
require("mini.surround").setup()
require("mason").setup({
	ensure_installed = {
		lsp = {
			"clangd",
			"pylsp",
			"lua_ls",
			"intelephense",
			"html-lsp",
		},
		formatter = {
			"clang-format",
			"stylua",
		},
		linter = {
			-- 'cpplint',
			-- 'pylint',
			"luacheck",
		},
	},
})
require("bufferin").setup({})
require("render-markdown").setup({})
require("select-undo").setup({})
require("mason-nvim-lint").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang-format" },
		cpp = { "clang-format" },
	},
	formatters = {
		clang_format = {
			prepend_args = { "--style=file", "--fallback-style=google" },
		},
	},
})

vim.lsp.enable("laravel_ls")

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
})

-- require 'nvim-treesitter.configs'.setup {
--   ensure_installed = { "php", "html" },
--   ...
-- }
--
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.blade = {
--     install_info = {
--         url = "https://github.com/EmranMR/tree-sitter-blade",
--         files = { "src/parser.c" },
--         branch = "main",
--     },
--     filetype = "blade",
-- }

require("fzf-lua").register_ui_select()
