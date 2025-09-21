-- Remove default keymaps
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gra')
vim.keymap.del('x', 'gra')
vim.keymap.del('n', 'grn')

-- Map silencer
local function map(mode, lhs, rhs, opts)
	local options = { silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Keep selection when indenting in visual mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Remove search highlight
map('n', '<Esc>', ':nohl<CR>')

-- Move window easily
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-t>', '<C-w>t')
map('n', '<C-b>', '<C-w>b')

-- Self explanatory, i wont add comments to each map thats obvious
map('n', '<leader>E', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- Easy save
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<Esc>:w<CR>')

-- Indent in current line depends on treesitter context
map('n', '@o', 'ddO')
-- Block q followed by o, but keep q instant otherwise
vim.keymap.set('n', 'q', function()
	local c = vim.fn.getcharstr()
	if c == 'o' then
		return ''
	else
		return 'q' .. c
	end
end, { expr = true })

map('n', 'gr', vim.lsp.buf.references, bufopts, { desc = 'Get references' })
map('n', 'gI', vim.lsp.buf.implementation, bufopts, { desc = 'Get implementation' })

map({ 'n', 'v' }, '<leader>c', '', { desc = 'Code' })
map({ 'v', 'x' }, '<leader>cf', function()
	require('conform').format()
end, { desc = 'Format selection' })
map('n', '<leader>cF', function()
	require('conform').format()
end, { desc = 'Format all' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Symbol rename' })
map('n', '<leader>cu', function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle Inlay Hint' })

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'c', 'cpp' },
	callback = function()
		map('n', '<leader>ch', ':LspClangdSwitchSourceHeader<cr>', { desc = 'Switch source header' })
	end,
})

map('n', '<leader>s', '', { desc = 'Search' })

-- Terminal
map({ 'n', 'x' }, '<leader>t', function()
	vim.cmd('Floater')
end, { desc = 'Toggle Terminal' })

-- Managers
map('n', '<leader>l', ':Lazy<cr>', { desc = 'Lazy Manager' })
map('n', '<leader>m', ':Mason<cr>', { desc = 'Mason Manager' })
