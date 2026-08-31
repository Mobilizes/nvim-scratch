return {
	{
		'ibhagwan/fzf-lua',
    enabled = false,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
		keys = {
			{ '<leader>f', '', desc = 'fzf' },
			-- { '<leader>ff', ':FzfLua files<CR>', desc = 'Find files' },
			{ '<leader>fr', ':FzfLua oldfiles<CR>', desc = 'Find recent files' },
		},
	},
}
