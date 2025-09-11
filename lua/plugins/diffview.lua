return {
	'sindrets/diffview.nvim',
	keys = {
		{
			'<leader>gO',
			':DiffviewOpen<cr>',
			desc = 'Open diffview',
		},
	},
	opts = {
		keymaps = {
			view = {
				{ 'n', 'q', ':DiffviewClose<cr>', desc = 'Close diffview' },
			},
			file_panel = {
				{ 'n', 'q', ':DiffviewClose<cr>', desc = 'Close diffview' },
			},
			option_panel = {
				{ 'n', 'q', ':DiffviewClose<cr>', desc = 'Close diffview' },
			},
			help_panel = {
				{ 'n', 'q', ':DiffviewClose<cr>', desc = 'Close diffview' },
			},
		},
	},
}
