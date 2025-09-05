-- Map silencer
local function map(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map('n', '<leader>E', ':NvimTreeToggle<CR>')
map('n', '<C-h>', '<C-w><Left>')
map('n', '<C-l>', '<C-w><Right>')
map('n', '<C-j>', '<C-w><Down>')
map('n', '<C-k>', '<C-w><Up>')

map('n', '<C-s>', ':w<CR>')
map('n', '@o', 'ddO')

map({ 'n', 'v' }, '<leader>c', '', { desc = 'Code' })
map('v', '<leader>cf', vim.lsp.buf.format, bufopts, { desc = 'Format selection' })
map('n', '<leader>cF', vim.lsp.buf.format, { desc = 'Format all' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Symbol rename' })

map('n', '<leader>l', ':Lazy<cr>', { desc = 'Lazy Manager' })
map('n', '<leader>m', ':Mason<cr>', { desc = 'Mason Manager' })
