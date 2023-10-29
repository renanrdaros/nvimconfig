return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    -- layout = {
    --   width = { min = 20, max = 60 }, -- min and max width of the columns
    -- },
  },
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        b = {name = "+buffer"},
        d = {name = "+diagnostics"},
        e = {name = "+explore"},
        f = {name = "+find"},
        g = {name = "+goto"},
      },
    })
  end
}
