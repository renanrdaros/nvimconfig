local g = vim.g
local opt = vim.opt

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.number = true         -- show line numbers
opt.relativenumber = true -- line numbers are relative to the current line
opt.splitbelow = true     -- splits put the new window below the current one
opt.splitright = true     -- vsplits put the new window to the right of the current one
opt.ignorecase = true     -- ignore case in search patterns
opt.smartcase = true      -- override 'ignorecase' if the pattern contains upper case chars
opt.tabstop = 4           -- number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 4        -- number of spaces to use for each step of (auto)indent
opt.expandtab = true      -- expand <Tab>s into spaces
opt.timeoutlen = 300      -- time in milliseconds to wait for a mapped sequence to complete
opt.termguicolors = true  -- enables 24-bit RGB color in the TUI
opt.completeopt = {       -- options for insert mode completion
  "menu",                 -- show possible completions on a popup menu
  "menuone",              -- show the menu also when there is only one match
  "noselect"              -- force the user to select a match from the menu
}
