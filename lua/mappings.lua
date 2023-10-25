-- set leader key
vim.keymap.set({"n", "v"}, "<space>", "<nop>")
vim.g.mapleader = " "

local wk = require("which-key")

-- normal mode mappings
wk.register({
  ["<leader>"] = {
    b = {
      name = "+buffer",
      p = { "<cmd>bprev<cr>", "Go to previous buffer" },
      n = { "<cmd>bnext<cr>", "Go to next buffer" },
      l = { "<cmd>Telescope buffers<cr>", "List open buffers" },
    },

    e = {
      name = "+explore",
      e = { "<cmd>Oil<cr>", "Explore current file's parent directory" },
      w = { "<cmd>Oil .<cr>", "Explore cwd" },
      h = { "<cmd>Oil ~<cr>", "Explore $USER home directory" },
      r = { "<cmd>Oil /<cr>", "Explore the root directory" },
    },

    f = {
      name = "+find",
      f = { "<cmd>Telescope find_files<cr>", "Find files in cwd" },
      e = { "<cmd>Telescope emoji<cr>", "Find emojis 😃" },
      g = { "<cmd>Telescope glyph<cr>", "Find glyphs" },
    },

    h = {
      name = "+help",
      t = { "<cmd>Telescope help_tags<cr>", "List avaiable help tags" },
      m = { "<cmd>Telescope man_pages<cr>", "List man page entries" },
    },

    T = {
      name = "+terminal",
      T = { "<cmd>exe v:count1 . \"ToggleTerm\"<cr>", "Toggle terminal (remembered)" },
      f = { "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>", "Toggle terminal (float)" },
      x = { "<cmd>exe v:count1 . \"ToggleTerm direction=horizontal\"<cr>", "Toggle terminal (horizontal)" },
      v = { "<cmd>exe v:count1 . \"ToggleTerm direction=vertical\"<cr>", "Toggle terminal (vertical)" },
    },
  },

  ["<a-f>"] = { "<cmd>Telescope find_files<cr>", "Find files in cwd" },
  ["<a-b>"] = { "<cmd>Telescope buffers<cr>", "List open buffers" },
  ["<a-/>"] = { "<cmd>Telescope live_grep<cr>", "Search for a string in cwd" },
  ["<a-*>"] = { "<cmd>Telescope grep_string<cr>", "Search for the string under the cursor in cwd" },
  ["<a-\\>"] = { "<cmd>Telescope file_browser<cr>", "Open Telescope file explorer/browser" },
  ["<a-T>"] = { "<cmd>exe v:count1 . \"ToggleTerm\"<cr>", "Toggle terminal (remembered)" },
})

-- terminal mode mappings
vim.api.nvim_create_autocmd("TermEnter", { pattern = "term://*toggleterm#*", command = [[tnoremap <silent><a-T> <cmd>exe v:count1 . "ToggleTerm"<cr>]] })

wk.register({
  ["<a-T>"] = { "Toggle terminal (remembered)" }, -- already mapped above 👆
  ["<esc>"] = { "<c-\\><c-n>", "Easier escape from terminal mode" },
}, { mode = "t" })
