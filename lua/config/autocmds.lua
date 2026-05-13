vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Highlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('rainbow_csv_autocall', {}),
	desc = 'Call :RainbowDelim on .csv buffer',
	pattern = 'csv',
	callback = function()
		vim.cmd('RainbowDelim')
	end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
	group = vim.api.nvim_create_augroup('cleanup_floater', {}),
	desc = 'Cleanup floater tmux instance',
	pattern = '*',
	callback = function()
		vim.cmd.terminal('tmux kill-session -t nvim-' .. vim.uv.getpid())
	end,
})
