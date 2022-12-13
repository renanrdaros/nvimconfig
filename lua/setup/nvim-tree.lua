require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "g?", action = "" },
        { key = "<M-?>", action = "toggle_help" },
      }
    }
  }
})
