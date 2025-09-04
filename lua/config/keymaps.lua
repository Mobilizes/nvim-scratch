vim.keymap.set('n', '<leader>E', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-h>', '<C-w><Left>')
vim.keymap.set('n', '<C-l>', '<C-w><Right>')
vim.keymap.set('n', '<C-j>', '<C-w><Down>')
vim.keymap.set('n', '<C-k>', '<C-w><Up>')

vim.keymap.set('n', '<leader>f', ':FzfLua files<CR>')

vim.keymap.set('n', '<C-s>', ':w<CR>')

vim.keymap.set('v', '<leader>cf', vim.lsp.buf.format, bufopts)
vim.keymap.set('v', '<leader>cF', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

vim.keymap.set('n', '<leader>b', ':Bufferin<cr>', { desc = 'Toggle Bufferin' })

vim.keymap.set('n', '<leader>l', ':Lazy<cr>', { desc = 'Lazy Manager' })
