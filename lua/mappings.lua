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
    b = {
      name = "+buffer",
      p = { "Go to previous buffer" }, -- already mapped in ./setup/hydra.lua
      n = { "Go to next buffer" },     -- already mapped in ./setup/hydra.lua
      l = { "<cmd>Telescope buffers<cr>", "Lists open buffers" },
    },

    s = {
      name = "+search",
      e = { "<cmd>Telescope emoji<cr>", "Search emojis 😃" },
      i = { "<cmd>Telescope glyph<cr>", "Search icons/glyphs" },
    },

    h = {
      name = "+help",
      t = { "<cmd>Telescope help_tags<cr>", "Lists avaiable help tags" },
      m = { "<cmd>Telescope man_pages<cr>", "Lists man page entries" },
      k = { "<cmd>Legendary<cr>", "Find keymaps, commands, and autocmds" },
    },

    t = {
      name = "+trouble",
      t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble list" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Show document diagnostics" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Show workspace diagnostics" },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "Show references of the symbol under the cursor" },
      D = { "<cmd>TroubleToggle lsp_definitions<cr>", "Show definitions of the symbol under the cursor" },
      T = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "Show type definitions of the symbol under the cursor" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Show items from the quickfix list" },
      l = { "<cmd>TroubleToggle loclist<cr>", "Show items from the window's location list" },
      K = { "Show diagnostics in a floating window" }, -- already mapped in ./setup/hydra.lua
      p = { "Go to previous diagnostic" },             -- already mapped in ./setup/hydra.lua
      n = { "Go to next diagnostic" },                 -- already mapped in ./setup/hydra.lua
    },

    T = {
      name = "+terminal",
      T = { "<cmd>exe v:count1 . \"ToggleTerm\"<cr>", "Toggle terminal (remembered)" },
      f = { "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>", "Toggle terminal (float)" },
      x = { "<cmd>exe v:count1 . \"ToggleTerm direction=horizontal\"<cr>", "Toggle terminal (horizontal)" },
      v = { "<cmd>exe v:count1 . \"ToggleTerm direction=vertical\"<cr>", "Toggle terminal (vertical)" },
    },
  },

  ["<a-P>"] = { "<cmd>Legendary<cr>", "Show all commands (Command Palette)" },
  ["<a-F>"] = { "<cmd>Telescope find_files<cr>", "Find files in your cwd" },
  ["<a-/>"] = { "<cmd>Telescope live_grep<cr>", "Search for a string in your cwd" },
  ["<a-*>"] = { "<cmd>Telescope grep_string<cr>", "Search for the string under your cursor in your cwd" },
  ["<a-|>"] = { "<cmd>NvimTreeToggle<cr>", "Toogle NvimTree file explorer/browser" },
  ["<a-\\>"] = { "<cmd>Telescope file_browser<cr>", "Open Telescope file explorer/browser" },
  ["<a-t>"] = { "<cmd>TroubleToggle<cr>", "Toggle Trouble list" },
  ["<a-T>"] = { "<cmd>exe v:count1 . \"ToggleTerm\"<cr>", "Toggle terminal (remembered)" },
})

-- terminal mode mappings
vim.api.nvim_create_autocmd("TermEnter", { pattern = "term://*toggleterm#*", command = [[tnoremap <silent><a-T> <cmd>exe v:count1 . "ToggleTerm"<cr>]] })

wk.register({
  ["<a-T>"] = { "Toggle terminal (remembered)" }, -- already mapped above 👆
  ["<esc>"] = { "<c-\\><c-n>", "Easier escape from terminal mode" }
}, { mode = "t" })
