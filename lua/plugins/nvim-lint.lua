return {
  'mfussenegger/nvim-lint',
  event = {
    'BufEnter',
    'BufWritePost',
    'BufReadPost',
    'TextChanged',
    'InsertLeave',
  },
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      lua = { 'luacheck' },
      -- python = { 'pylint' },
      -- cpp = { 'cpplint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({
      'BufEnter',
      'BufWritePost',
      'BufReadPost',
      'TextChanged',
      'InsertLeave',
    }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    })

    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
      group = lint_augroup,
      callback = function(args)
        vim.diagnostic.reset(nil, args.buf)
      end,
    })
  end,
}
