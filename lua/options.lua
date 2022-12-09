local opt = vim.opt

opt.number = true         -- show line numbers
opt.relativenumber = true -- line numbers are relative to the current line
opt.splitbelow = true     -- splits put the new window below the current one
opt.splitright = true     -- vsplits put the new window to the right of the current one
opt.ignorecase = true     -- ignore case in search patterns
opt.smartcase = true      -- override 'ignorecase' if the pattern contains upper case chars
opt.tabstop = 4           -- number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 4        -- number of spaces to use for each step of (auto)indent
opt.expandtab = true      -- expand <Tab>s into spaces
