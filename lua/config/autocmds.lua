vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Highlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('native_treesitter', { clear = true }),
	desc = 'Start native Tree-sitter when a parser is available',
	pattern = '*',
	callback = function(args)
		local filetype = vim.bo[args.buf].filetype
		if filetype == '' then
			return
		end

		local ok, lang = pcall(vim.treesitter.language.get_lang, filetype)
		if not ok or not lang then
			return
		end

		pcall(vim.treesitter.start, args.buf, lang)
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
