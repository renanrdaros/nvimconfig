return {
  "rebelot/kanagawa.nvim",
  lazy = true,
  -- priority = 1000,
  config = function()
    require("kanagawa").setup({
      dimInactive = true,
    })
    -- vim.cmd.colorscheme("kanagawa")
  end,
}
