vim.keymap.set('n', '<leader>E', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-h>', '<C-w><Left>')
vim.keymap.set('n', '<C-l>', '<C-w><Right>')
vim.keymap.set('n', '<C-j>', '<C-w><Down>')
vim.keymap.set('n', '<C-k>', '<C-w><Up>')

vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<C-o>', 'ddO')

vim.keymap.set({ 'n', 'v' }, '<leader>c', '', { desc = 'Code' })
vim.keymap.set('v', '<leader>cf', vim.lsp.buf.format, bufopts, { desc = 'Format selection' })
vim.keymap.set('n', '<leader>cF', vim.lsp.buf.format, { desc = 'Format all' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })

vim.keymap.set('n', '<leader>l', ':Lazy<cr>', { desc = 'Lazy Manager' })
vim.keymap.set('n', '<leader>m', ':Mason<cr>', { desc = 'Mason Manager' })
