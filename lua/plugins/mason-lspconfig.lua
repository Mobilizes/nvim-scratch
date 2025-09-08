return {
  'mason-org/mason-lspconfig.nvim',
  opts = {},
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {},
      dependencies = {
        'stevearc/dressing.nvim',
        opts = {},
        event = 'VeryLazy'
      },
    },
    'neovim/nvim-lspconfig',
  },
}
