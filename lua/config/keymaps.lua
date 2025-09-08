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
map('n', '<C-h>', '<C-w><Left>')
map('n', '<C-l>', '<C-w><Right>')
map('n', '<C-j>', '<C-w><Down>')
map('n', '<C-k>', '<C-w><Up>')

-- Self explanatory, i wont add comments to each map thats obvious
map('n', '<leader>E', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- Easy save
map('n', '<C-s>', ':w<CR>')

-- Indent in current line depends on treesitter context
map('n', '@o', 'ddO')

map('n', 'gr', vim.lsp.buf.references, bufopts, { desc = 'Get references' })
map('n', 'gI', vim.lsp.buf.implementation, bufopts, { desc = 'Get implementation' })

map({ 'n', 'v' }, '<leader>c', '', { desc = 'Code' })
map('v', '<leader>cf', vim.lsp.buf.format, bufopts, { desc = 'Format selection' })
map('n', '<leader>cF', vim.lsp.buf.format, { desc = 'Format all' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Symbol rename' })

-- Managers
map('n', '<leader>l', ':Lazy<cr>', { desc = 'Lazy Manager' })
map('n', '<leader>m', ':Mason<cr>', { desc = 'Mason Manager' })
