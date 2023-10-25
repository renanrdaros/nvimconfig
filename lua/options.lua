vim.opt.number = true         -- show line numbers
vim.opt.relativenumber = true -- line numbers are relative to the current line
vim.opt.splitbelow = true     -- splits put the new window below the current one
vim.opt.splitright = true     -- vsplits put the new window to the right of the current one
vim.opt.ignorecase = true     -- ignore case in search patterns
vim.opt.smartcase = true      -- override 'ignorecase' if the pattern contains upper case chars
vim.opt.tabstop = 4           -- number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4        -- number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true      -- expand <Tab>s into spaces
vim.opt.wrap = false          -- disable line wrap
vim.opt.timeoutlen = 300      -- time in milliseconds to wait for a mapped sequence to complete
vim.opt.termguicolors = true  -- enables 24-bit RGB color in the TUI
vim.opt.inccommand = "split"  -- show the effects of a command in a preview window
vim.opt.completeopt = {       -- options for insert mode completion
  "menu",                 -- show possible completions on a popup menu
  "menuone",              -- show the menu also when there is only one match
  "noselect"              -- force the user to select a match from the menu
}
