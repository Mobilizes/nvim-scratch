return {
	'akinsho/bufferline.nvim',
	enabled = false,
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
		options = {
			custom_filter = function(buf_number)
				if vim.b[buf_number].floater_buffer then
					return false
				end

				local excluded = { '', 'qf', 'grug-far', 'help' }
				local filetype = vim.bo[buf_number].filetype
				for _, ft in ipairs(excluded) do
					if filetype == ft then
						return false
					end
				end

				return true
			end,
			diagnostics = 'nvim_lsp',
			diagnostics_indicator = function(count, level)
				local icon = level:match('error') and ' ' or ' '
				return icon .. count
			end,
			always_show_bufferline = false,
		},
	},
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
