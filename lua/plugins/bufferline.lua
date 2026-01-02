return {
	'akinsho/bufferline.nvim',
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		{
			'<leader>bd',
			function()
				local current_buf = vim.api.nvim_get_current_buf()

				vim.cmd('normal \x0f')

				if vim.api.nvim_get_current_buf() == current_buf then
					local success, _ = pcall(vim.cmd, 'buffer #')

					if not success or vim.api.nvim_get_current_buf() == current_buf then
						vim.cmd('bprevious')
					end
				end

				if vim.api.nvim_get_current_buf() ~= current_buf then
					vim.cmd('bdelete! ' .. current_buf)
				else
					vim.cmd('bdelete!')
				end
			end,
			desc = 'Delete current buffer',
			silent = true,
		},
		{ '<S-h>', ':bprevious<CR>', silent = true },
		{ '<S-l>', ':bnext<CR>', silent = true },
	},
}
