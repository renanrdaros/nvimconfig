local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for severity, icon in pairs(signs) do
  local name = "DiagnosticSign" .. severity
  vim.fn.sign_define(name, { text = icon, texthl = name, linehl = "", numhl = "" })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  require("lsp_signature").on_attach({
    bind = true,
    hint_enable = false,
    hint_prefix = " ",
    -- handler_opts = {
    --   border = "rounded"
    -- },
    toggle_key = "<A-K>",
    select_signature_key = "<A-k>",
  }, bufnr)

  -- Mappings.
  local wk = require("which-key")

  wk.register({
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    ["gd"]         = { vim.lsp.buf.declaration, "Jump to symbol declaration" },
    ["gi"]         = { vim.lsp.buf.implementation, "List symbol implementations" },
    ["gD"]         = { vim.lsp.buf.definition, "Jump to symbol definition" },
    ["gT"]         = { vim.lsp.buf.type_definition, "Jump to type definition" },
    ["gr"]         = { vim.lsp.buf.references, "List symbol references" },
    ["K"]          = { vim.lsp.buf.hover, "Show hover information" },
    ["<leader>wa"] = { vim.lsp.buf.add_workspace_folder, "Add folder to workspace" },
    ["<leader>wr"] = { vim.lsp.buf.remove_workspace_folder,  "Remove folder from workspace" },
    ["<leader>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" },
    ["<leader>rn"] = { vim.lsp.buf.rename, "Rename symbol references" },
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Select an available code action" },
    ["<leader>bf"] = { vim.lsp.buf.formatting, "Format current buffer" },
  }, { buffer = bufnr })

  wk.register({
    ["<A-K>"] = { "Toggle signature help on and off" },
    ["<A-k>"] = { "Cycle to next signature" },
  }, { buffer = bufnr, mode = "i" })

end

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig["clangd"].setup{
    on_attach = on_attach,
    capabilities = capabilites,
}

lspconfig["pyright"].setup{
    on_attach = on_attach,
    capabilities = capabilites,
}

lspconfig["cmake"].setup{
    on_attach = on_attach,
    capabilities = capabilites,
}
