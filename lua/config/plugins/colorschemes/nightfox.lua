return {
  "EdenEast/nightfox.nvim",
  lazy = true,
  --priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        dim_inactive = true,    -- Non focused panes set to alternative background
      },
    })
  end
}
