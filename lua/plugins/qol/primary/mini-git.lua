return {
	'nvim-mini/mini-git',
	version = '*',
	config = function()
		local mini_git = require('mini.git')
		mini_git.setup()

		local function map(mode, lhs, rhs, opts)
			local options = { silent = true }
			if opts then
				options = vim.tbl_extend('force', options, opts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end

		map('n', '<leader>gh', function()
			mini_git.show_range_history()
		end, { desc = 'View git history' })
		map('v', '<leader>gh', function()
			mini_git.show_range_history()
		end, { desc = 'View git history' })
	end,
}
