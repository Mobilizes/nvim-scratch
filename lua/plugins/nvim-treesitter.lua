return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = {
    ensure_installed = 'blade',
    highlight = {
      enable = true
    },
  },
}
