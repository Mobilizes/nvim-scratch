require('nvim-web-devicons').set_icon({
	mason = {
		icon = '󰢛',
		color = '#428850',
		cterm_color = '65',
		name = 'mason',
	},
})
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
		'ts_ls',
		'bashls',
		'gopls',
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
		'duster',
		'prettier',
		'shfmt',
		'goimports',
		'fixjson',
	},
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
		javascript = { 'prettier' },
		html = { 'prettier' },
		css = { 'prettier' },
		sh = { 'shfmt' },
		bash = { 'shfmt' },
		zsh = { 'shfmt' },
		go = { 'goimports' },
		json = { 'fixjson' },
	},
	formatters = {
		clang_format = {
			prepend_args = { '--style=file', '--fallback-style=google' },
		},
	},
})
require('rainbow_csv').setup({})
require('Comment').setup()
require('colorizer').setup()
require('image').enable()

vim.lsp.enable('laravel_ls')

require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'lua',
		'python',
		'javascript',
		'typescript',
		'html',
		'css',
		'json',
		'php',
		'bash',
	},
	sync_install = false, -- install asynchronously
	auto_install = true, -- automatically install missing parsers
	highlight = {
		enable = true, -- enable Treesitter highlighting
	},
	indent = {
		enable = true,
	},
})

require('nvim-ts-autotag').setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
		['html'] = {
			enable_close = true,
		},
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
require('luasnip.loaders.from_vscode').lazy_load({ paths = '~/.config/nvim/snippets' })

vim.lsp.config.clangd = {
	cmd = {
		'clangd',
		'--background-index',
		'--clang-tidy',
		'--completion-style=detailed',
		'--function-arg-placeholders',
		'--fallback-style=google',
		'--enable-config',
		'--header-insertion=never',
	},
	root_markers = { '.clangd', 'compile_commands.json' },
	filetypes = { 'c', 'cpp' },
}
