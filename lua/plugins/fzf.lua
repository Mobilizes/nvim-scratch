return {
	{
		'ibhagwan/fzf-lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
		keys = {
			{ '<leader>f', '', desc = 'fzf' },
			-- { '<leader>ff', ':FzfLua files<CR>', desc = 'Find files' },
			{ '<leader>fr', ':FzfLua oldfiles<CR>', desc = 'Find recent files' },
		},
	},
	{
		'folke/which-key.nvim',
		opts = function()
			local wk = require('which-key')

			wk.add({
				{ '<leader>f', '', group = 'fzf', icon = '󰉓' },
			})
		end,
	},
}
