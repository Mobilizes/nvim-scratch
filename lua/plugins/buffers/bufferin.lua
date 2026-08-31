return {
	'wasabeef/bufferin.nvim',
	cmd = { 'Bufferin' },
	opts = {
    show_window_layout = true,
  },
	dependencies = {
		'nvim-tree/nvim-web-devicons', -- For file icons
	},
	keys = {
		{ '<leader>b', ':Bufferin<cr>', desc = 'Toggle Bufferin', silent = true },
	},
}
