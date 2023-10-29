return {
  "nvim-telescope/telescope.nvim", branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
    "xiyaowong/telescope-emoji.nvim",
    "ghassan0/telescope-glyph.nvim",
  },
  config = function()
    local ts = require("telescope")

    ts.setup({
      defaults = {
        mappings = {
          i = {
            ["<M-?>"] = "which_key",
          },
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = false,
        },
        emoji = {
          action = function(emoji)
            -- argument emoji is a table.
            -- {name="", value="", cagegory="", description=""}

            -- vim.fn.setreg("*", emoji.value)
            -- print([[Press p or "*p to paste this emoji]] .. emoji.value)

            -- insert emoji when picked
            vim.api.nvim_put({ emoji.value }, 'c', false, true)
          end,
        },
        glyph = {
          action = function(glyph)
            -- argument glyph is a table.
            -- {name="", value="", category="", description=""}

            -- vim.fn.setreg("*", glyph.value)
            -- print([[Press p or "*p to paste this glyph]] .. glyph.value)

            -- insert glyph when picked
            vim.api.nvim_put({ glyph.value }, 'c', false, true)
          end,
        },
      },
    })

    ts.load_extension("fzf")
    ts.load_extension("file_browser")
    ts.load_extension("emoji")
    ts.load_extension("glyph")
  end,
}
