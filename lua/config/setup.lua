require('lualine').setup()
require('mini.surround').setup()
require('mason').setup({
  ensure_installed = {
    lsp = {
      'clangd',
      'pylsp',
      'lua_ls',
      'intelephense',
      'html-lsp',
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
require('render-markdown').setup({})
require('select-undo').setup({})
require('laravel').setup({
  notifications = false,
})

vim.lsp.enable('laravel_ls')
vim.lsp.config('intelephense', {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php', 'blade' },
})
vim.lsp.enable('intelephense')
