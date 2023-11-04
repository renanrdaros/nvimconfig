-- set leader key
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>")
vim.g.mapleader = " "

-- buffer ops
vim.keymap.set("n", "<leader>bp", "<Cmd>bprev<CR>", {desc = "Go to previous buffer"})
vim.keymap.set("n", "<leader>bN", "<Cmd>bNext<CR>", {desc = "Go to previous buffer"})
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", {desc = "Go to next buffer"})
vim.keymap.set("n", "<leader>bl", "<Cmd>buffers<CR>", {desc = "List/Show all buffers"})
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", {desc = "Unload and delete buffer"})

-- file explorer
vim.keymap.set("n", "<leader>ee", "<Cmd>Oil<CR>", {desc = "Explore current file's parent directory"})
vim.keymap.set("n", "<leader>ew", "<Cmd>Oil .<CR>", {desc = "Explore cwd"})
vim.keymap.set("n", "<leader>eh", "<Cmd>Oil ~<CR>", {desc = "Explore $USER home directory"})
vim.keymap.set("n", "<leader>er", "<Cmd>Oil /<CR>", {desc = "Explore the root directory"})

-- telescope
vim.keymap.set("n", "<leader>tf", "<Cmd>Telescope find_files<CR>", {desc = "Search for files in cwd"})
vim.keymap.set("n", "<leader>tw", "<Cmd>Telescope file_browser<CR>", {desc = "Explore cwd"})
vim.keymap.set("n", "<leader>tb", "<Cmd>Telescope buffers<CR>", {desc = "List open buffers"})
vim.keymap.set("n", "<leader>te", "<Cmd>Telescope emoji<CR>", {desc = "Search emojis 😃"})
vim.keymap.set("n", "<leader>tg", "<Cmd>Telescope glyph<CR>", {desc = "Search glyphs"})
vim.keymap.set("n", "<leader>tm", "<Cmd>Telescope man_pages<CR>", {desc = "List man page entries"})
vim.keymap.set("n", "<leader>th", "<Cmd>Telescope help_tags<CR>", {desc = "List avaiable help tags"})
vim.keymap.set("n", "<leader>tc", "<Cmd>Telescope commands<CR>", {desc = "List available commands"})
vim.keymap.set("n", "<leader>tk", "<Cmd>Telescope keymaps<CR>", {desc = "List available keymaps"})
vim.keymap.set("n", "<leader>t/", "<Cmd>Telescope live_grep<CR>", {desc = "Search for a string in cwd"})
vim.keymap.set("n", "<leader>t*", "<Cmd>Telescope grep_string<CR>", {desc = "Search for the string under cursor in cwd"})

-- diagnostics
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<M-d>", vim.diagnostic.open_float, {desc = "Show diagnostics in a floating window"})
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {desc = "Move to the previous diagnostic"})
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {desc = "Move to the next diagnostic"})
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, {desc = "Add buffer diagnostics to the location list"})
vim.keymap.set("n", "<leader>dd", function() vim.diagnostic.disable(0) end, {desc = "Disable diagnostics in current buffer"})
vim.keymap.set("n", "<leader>dD", vim.diagnostic.disable, {desc = "Disable diagnostics in all buffers"})
vim.keymap.set("n", "<leader>de", function() vim.diagnostic.enable(0) end, {desc = "Enable diagnostics in current buffer"})
vim.keymap.set("n", "<leader>dE", vim.diagnostic.enable, {desc = "Enable diagnostics in all buffers"})

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc = "Easier escape from terminal mode"})
