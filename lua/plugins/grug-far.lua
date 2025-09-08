return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        -- TODO: for some stupid reason, it doesnt work and it still goes to the left.
        -- the only way is to use botright, and even then it still does not work
        -- ts so ass 💔
        grug.open({
          openTargetWindow = {
            preferredLocation = 'right',
          },
        })
      end,
      desc = "Grep workspace",
      silent = true
    },
  },
}
