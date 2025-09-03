vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')

vim.cmd('set relativenumber')

vim.cmd('set clipboard=unnamedplus')

require('config.lazy')

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- could be "●", "▎", "x", etc.
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('lualine').setup()
require('mini.surround').setup()
require('mason').setup({
  ensure_installed = {
    lsp = {
      'clangd',
      'pylsp',
      'lua_ls',
    },
    formatter = {
      'clang-format'
    },
    linter = {
      -- 'cpplint',
      -- 'pylint',
      'luacheck',
    },
  },
})
require('bufferin').setup({})

require('config.keymaps')

vim.cmd('colorscheme catppuccin-mocha')
