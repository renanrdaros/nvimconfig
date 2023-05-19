require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    number = true,
    relativenumber = true,
    mappings = {
      list = {
        { key = "g?", action = "" },
        { key = "<M-?>", action = "toggle_help" },
      }
    }
  }
})
