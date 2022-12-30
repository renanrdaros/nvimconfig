local hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint_config = { border = "double", position = "bottom" }

hydra({
  name = "Windows",
  mode = "n",
  hint = [[

    Window Resize
    -------------

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
  
  Buffers Navigation
  ------------------

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

hydra({
  name = "Horizontal Scroll",
  mode = "n",
  hint = [[

                        Horizontal Scroll
                        -----------------
  
    _h_  _l_   : move left/right
   _H_  _L_  : move left/right half a screenwidth
  ┃ _s_  _e_ ┃ : move cursor position to start/end of the screen  

                                                         _<Esc>_  
  ]],
  config = {
    hint = hint_config
  },
  body = "z",
  heads = {
    { "h", "zh" },
    { "l", "zl" },
    { "H", "zH" },
    { "L", "zL" },
    { "s", "zs" },
    { "e", "ze" },
  }
})
