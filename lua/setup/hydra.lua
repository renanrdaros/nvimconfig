local hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint_config = { border = "double", position = "middle" }

hydra({
  name = "Windows",
  mode = "n",
  hint = [[

  Win Resize
  ----------

  _>_: increase width   
  _<_: decrease width   
  _+_: increase height  
  _-_: decrease height  

               _<Esc>_
  ]],
  config = {
    hint = hint_config
  },
  body = "<c-w>",
  heads = {
    { ">", "<c-w>>" },
    { "<", "<c-w><" },
    { "+", "<c-w>+" },
    { "-", "<c-w>-" },
  }
})

hydra({
  name = "Buffers Navigation",
  mode = "n",
  hint = [[
  
  Buf Navigation
  --------------

  _p_: previous buffer  
  _n_: next buffer

               _<Esc>_
  ]],
  config = {
    hint = hint_config
  },
  body = "<leader>b",
  heads = {
    { "p", cmd("bprev") },
    { "n", cmd("bnext") },
  }
})

hydra({
  name = "Trouble",
  mode = "n",
  hint = [[

         Trouble
         -------

  _K_: hover
  _p_: previous diagnostic  
  _n_: next diagnostic

                   _<Esc>_ 
  ]],
  config = {
    hint = hint_config
  },
  body = "<leader>t",
  heads = {
    { "K", vim.diagnostic.open_float },
    { "p", vim.diagnostic.goto_prev },
    { "n", vim.diagnostic.goto_next },
  }
})
