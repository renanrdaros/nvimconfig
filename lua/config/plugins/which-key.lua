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

    -- normal mode mappings
    wk.register({
      ["<leader>"] = {
        b = {
          name = "+buffer",
          p = { "<Cmd>bprev<CR>", "Go to previous buffer" },
          n = { "<Cmd>bnext<CR>", "Go to next buffer" },
        },

        e = {
          name = "+explore",
          e = { "<Cmd>Oil<CR>", "Explore current file's parent directory" },
          w = { "<Cmd>Oil .<CR>", "Explore cwd" },
          h = { "<Cmd>Oil ~<CR>", "Explore $USER home directory" },
          r = { "<Cmd>Oil /<CR>", "Explore the root directory" },
          t = { "<Cmd>Telescope file_browser<CR>", "Explore cwd using Telescope File Browser" },
        },

        f = {
          name = "+find",
          f = { "<Cmd>Telescope find_files<CR>", "Find files in cwd" },
          b = { "<Cmd>Telescope buffers<CR>", "Find buffers" },
          e = { "<Cmd>Telescope emoji<CR>", "Find emojis 😃" },
          g = { "<Cmd>Telescope glyph<CR>", "Find glyphs" },
          m = { "<Cmd>Telescope man_pages<CR>", "Find man page entries" },
          h = { "<Cmd>Telescope help_tags<CR>", "Find avaiable help tags" },
        },
      },

      ["<leader>f/"] = { "<Cmd>Telescope live_grep<CR>", "Find string in cwd" },
      ["<leader>f*"] = { "<Cmd>Telescope grep_string<CR>", "Find string under cursor in cwd" },

      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      ["<M-d>"] = { vim.diagnostic.open_float, "Show diagnostics in a floating window" },
      ["<leader>dp"] = { vim.diagnostic.goto_prev, "Move to the previous diagnostic" },
      ["<leader>dn"] = { vim.diagnostic.goto_next, "Move to the next diagnostic" },
      ["<leader>dl"] = { vim.diagnostic.setloclist, "Add buffer diagnostics to the location list" },
      ["<leader>dd"] = { vim.diagnostic.disable, "Disable diagnostics in all buffers" },
      ["<leader>de"] = { vim.diagnostic.enable, "Enable diagnostics in all buffers" },
    })

    -- terminal mode mappings
    wk.register({
      ["<Esc>"] = { "<C-\\><C-n>", "Easier escape from terminal mode" },
    }, { mode = "t" })
  end
}
