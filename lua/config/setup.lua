require('nvim-web-devicons').set_icon {
  mason = {
    icon = "󰢛",
    color = "#428850",
    cterm_color = "65",
    name = "mason"
  }
}
require('lualine').setup()
require('mini.surround').setup()
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'clangd',
		'pylsp',
		'lua_ls',
		'intelephense',
		'html',
		'jsonls',
    'duster',
	},
})
require('mason-tool-installer').setup({
  ensure_installed = {
    'luacheck',
    'clang-format',
    'php-cs-fixer',
    'blade-formatter',
    'stylua',
    'black',
  }
})
require('bufferin').setup({})
require('render-markdown').setup({})
require('select-undo').setup({})
require('mason-nvim-lint').setup()
require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		c = { 'clang-format' },
		cpp = { 'clang-format' },
		php = { 'php_cs_fixer' },
		blade = { 'blade-formatter' },
		python = { 'black' },
	},
	formatters = {
		clang_format = {
			prepend_args = { '--style=file', '--fallback-style=google' },
		},
	},
})

vim.lsp.enable('laravel_ls')

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "php",
    "bash",
  },
  sync_install = false,   -- install asynchronously
  auto_install = true,    -- automatically install missing parsers
  highlight = {
    enable = true,        -- enable Treesitter highlighting
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

require('fzf-lua').register_ui_select()
