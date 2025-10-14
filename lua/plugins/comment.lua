return {
	'numToStr/Comment.nvim',
	dependencies = {
		'JoosepAlviste/nvim-ts-context-commentstring',
		opts = {
			enable_autocmd = false,
		},
	},
	opts = {
		{
			mappings = {
				basic = true,
				extra = false,
			},
		},
	},
}
