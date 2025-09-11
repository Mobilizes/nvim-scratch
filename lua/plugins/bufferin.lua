return {
	'wasabeef/bufferin.nvim',
	cmd = { 'Bufferin' },
	config = function()
		require('bufferin').setup()
	end,
	dependencies = {
		'nvim-tree/nvim-web-devicons', -- For file icons
	},
	keys = {
		{ '<leader>b', ':Bufferin<cr>', desc = 'Toggle Bufferin', silent = true },
	},
}
