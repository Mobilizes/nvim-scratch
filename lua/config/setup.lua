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
require('render-markdown').setup({})
require('select-undo').setup({})

vim.lsp.enable('laravel_ls')
