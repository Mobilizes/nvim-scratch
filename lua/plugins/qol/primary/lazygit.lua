return {
	'kdheepak/lazygit.nvim',
	lazy = true,
	cmd = {
		'LazyGit',
		'LazyGitConfig',
		'LazyGitCurrentFile',
		'LazyGitFilter',
		'LazyGitFilterCurrentFile',
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	keys = {
		{ '<leader>g', '', desc = 'Git + Surrounds' },
		{ '<leader>gg', '<cmd>LazyGitCurrentFile<cr>', desc = 'LazyGit' },
	},
}
