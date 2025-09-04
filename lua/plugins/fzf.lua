return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    { '<leader>f', '', desc = 'Fzf' },
    { '<leader>ff', ':FzfLua files<CR>', desc = 'Find files' },
    { '<leader>fr', ':FzfLua oldfiles<CR>', desc = 'Find recent files' },
  }
}

