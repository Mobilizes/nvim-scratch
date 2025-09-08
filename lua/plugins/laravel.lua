return {
  "adibhanna/laravel.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { '<leader>L',  '',                  desc = 'Laravel' },
    { "<leader>La", ":Artisan<cr>",      desc = "Laravel Artisan" },
    { "<leader>Lc", ":Composer<cr>",     desc = "Composer" },
    { "<leader>Lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
    { "<leader>Lm", ":LaravelMake<cr>",  desc = "Laravel Make" },
  },
}
