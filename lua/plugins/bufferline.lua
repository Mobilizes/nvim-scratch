return {
	'akinsho/bufferline.nvim',
	enabled = true,
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		{ '<leader>b', '', desc = 'Buffers' },
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
		{
			'<leader>bp',
			':BufferLineTogglePin<CR>',
			desc = 'Toggle pin on current buffer',
			silent = true,
		},
		{
			'<leader>bP',
			':BufferLineGroupClose ungrouped<CR>',
			desc = 'Delete all unpinned buffers',
			silent = true,
		},
		{ '<leader>bb', ':BufferLinePick<CR>', desc = 'Pick a buffer', silent = true },
		{
			'<leader>bl',
			':BufferLineCloseLeft<CR>',
			desc = 'Delete all buffers to the left',
			silent = true,
		},
		{
			'<leader>br',
			':BufferLineCloseRight<CR>',
			desc = 'Delete all buffers to the right',
			silent = true,
		},
		{ '<S-h>', ':BufferLineCyclePrev<CR>', silent = true },
		{ '<S-l>', ':BufferLineCycleNext<CR>', silent = true },
	},
}
