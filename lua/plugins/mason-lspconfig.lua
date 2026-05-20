return {
	'mason-org/mason-lspconfig.nvim',
	opts = {
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
			'cssls',
			'neocmake',
			'rust_analyzer',
		},
	},
	dependencies = {
		{
			'mason-org/mason.nvim',
			opts = {},
		},
		{
			'folke/which-key.nvim',
			opts = function()
				local wk = require('which-key')

				wk.add({
					{ '<leader>m', desc = 'Mason Manager', icon = '󰢛' },
				})
			end,
		},
		'neovim/nvim-lspconfig',
	},
}
