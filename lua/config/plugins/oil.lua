return {
  "stevearc/oil.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    local oil = require("oil")
    oil.setup({
      columns = {
        "icons",
        "permissions",
      },
      keymaps = {
        ["<C-s>"] = false,
        ["<C-h>"] = false,
        ["<C-t>"] = false,
        ["<C-p>"] = false,
        ["gx"] = false,
        ["g."] = false,
        ["g?"] = false,
        ["<leader>v"] = "actions.select_vsplit",
        ["<leader>s"] = "actions.select_split",
        ["<leader>t"] = "actions.select_tab",
        ["<leader>p"] = "actions.preview",
        ["<leader>x"] = "actions.open_external",
        ["<leader>."] = "actions.toggle_hidden",
        ["<BS>"] = "actions.parent",
        ["<leader>?"] = {
          callback = function()
            local config = require("oil.config")
            require("oil.keymap_util").show_help(config.keymaps)
          end,
          desc = "Show oil keymaps",
          mode = "n"
        },
        ["<Esc>"] = {
          callback = function() oil.close() end,
          desc = "Close oil and restore original buffer",
          mode = "n"
        },
      },
      view_options = {
        show_hidden = true,
      },
    })
  end
}
