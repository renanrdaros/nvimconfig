local ts = require("telescope")

ts.setup {
  extensions = {
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
}

ts.load_extension("fzf")
ts.load_extension("file_browser")
ts.load_extension("emoji")
ts.load_extension("glyph")
