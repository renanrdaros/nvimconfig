local map = vim.keymap

-- set leader key
map.set({"n", "v"}, "<space>", "<nop>")
vim.g.mapleader = " "

-- automatically register which-key tables with legendary
require("legendary").setup({ which_key = { auto_register = true } })

local wk = require("which-key")

-- normal mode mappings
wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find files in your cwd" },
      b = { "<cmd>Telescope file_browser<cr>", "Open Telescope file browser" },
      n = { "<cmd>enew<cr>", "New File" },
    },

    b = {
      name = "+buffer",
      l = { "<cmd>Telescope buffers<cr>", "Lists open buffers" },
    },

    s = {
      name = "+search",
      g = { "<cmd>Telescope live_grep<cr>", "Search for a string in your cwd" },
      s = { "<cmd>Telescope grep_string<cr>", "Search for the string under your cursor in your cwd" },
      e = { "<cmd>Telescope emoji<cr>", "Search emojis 😃" },
      i = { "<cmd>Telescope glyph<cr>", "Search icons/glyphs" },
    },

    h = {
      name = "+help",
      t = { "<cmd>Telescope help_tags<cr>", "Lists avaiable help tags" },
      m = { "<cmd>Telescope man_pages<cr>", "Lists man page entries" },
      k = { "<cmd>Legendary<cr>", "Find keymaps, commands, and autocmds" },
    },
  },

  ["<c-\\>"] = { "<cmd>NvimTreeToggle<cr>", "Toogle file explorer" },
  ["<a-t>"] = { "<cmd>lua require('FTerm').toggle()<cr>", "Toggle FTerm" },
})

-- terminal mode mappings
wk.register({
  ["<a-t>"] = { "<c-\\><c-n><cmd>lua require('FTerm').toggle()<cr>", "Toggle FTerm" },
}, { mode = "t" })
