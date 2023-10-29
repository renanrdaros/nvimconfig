-- set leader key
vim.keymap.set({"n", "v"}, "<space>", "<nop>")
vim.g.mapleader = " "

-- buffer ops
vim.keymap.set("n", "<leader>gB", "<Cmd>bprev<CR>", {desc = "Go to previous buffer"})
vim.keymap.set("n", "<leader>gb", "<Cmd>bnext<CR>", {desc = "Go to next buffer"})

-- file explorer
vim.keymap.set("n", "<leader>ee", "<Cmd>Oil<CR>", {desc = "Explore current file's parent directory"})
vim.keymap.set("n", "<leader>ew", "<Cmd>Oil .<CR>", {desc = "Explore cwd"})
vim.keymap.set("n", "<leader>eh", "<Cmd>Oil ~<CR>", {desc = "Explore $USER home directory"})
vim.keymap.set("n", "<leader>er", "<Cmd>Oil /<CR>", {desc = "Explore the root directory"})
vim.keymap.set("n", "<leader>et", "<Cmd>Telescope file_browser<CR>", {desc = "Explore cwd using Telescope File Browser"})

-- find
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", {desc = "Find files in cwd"})
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", {desc = "Find buffers"})
vim.keymap.set("n", "<leader>fe", "<Cmd>Telescope emoji<CR>", {desc = "Find emojis 😃"})
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope glyph<CR>", {desc = "Find glyphs"})
vim.keymap.set("n", "<leader>fm", "<Cmd>Telescope man_pages<CR>", {desc = "Find man page entries"})
vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", {desc = "Find avaiable help tags"})
vim.keymap.set("n", "<leader>f/", "<Cmd>Telescope live_grep<CR>", {desc = "Find string in cwd"})
vim.keymap.set("n", "<leader>f*", "<Cmd>Telescope grep_string<CR>", {desc = "Find string under cursor in cwd"})

-- diagnostics
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<M-d>", vim.diagnostic.open_float, {desc = "Show diagnostics in a floating window"})
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {desc = "Move to the previous diagnostic"})
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {desc = "Move to the next diagnostic"})
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, {desc = "Add buffer diagnostics to the location list"})
vim.keymap.set("n", "<leader>dd", vim.diagnostic.disable, {desc = "Disable diagnostics in all buffers"})
vim.keymap.set("n", "<leader>de", vim.diagnostic.enable, {desc = "Enable diagnostics in all buffers"})

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc = "Easier escape from terminal mode"})
