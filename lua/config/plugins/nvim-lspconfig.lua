return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "ray-x/lsp_signature.nvim",
      },
    },
  },
  config = function()
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
        toggle_key = "<M-s>",
        select_signature_key = "<M-S>",
      }, bufnr)

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {desc = "Go to symbol declaration", buffer = bufnr})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "Go to symbol definition", buffer = bufnr})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {desc = "Go to symbol implementations", buffer = bufnr})
      vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {desc = "Go to type definition", buffer = bufnr})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = "Go to symbol references", buffer = bufnr})
      vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, {desc = "Rename symbol references", buffer = bufnr})
      vim.keymap.set("n", "<M-h>", vim.lsp.buf.hover, {desc = "Show hover information", buffer = bufnr})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Select an available code action", buffer = bufnr})
      vim.keymap.set("n", "<leader>bf", vim.lsp.buf.formatting, {desc = "Format current buffer", buffer = bufnr})
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {desc = "Add folder to workspace", buffer = bufnr})
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {desc = "Remove folder from workspace", buffer = bufnr})
      vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
                      {desc = "List workspace folders", buffer = bufnr})
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

    lspconfig["rust_analyzer"].setup{
        on_attach = on_attach,
        capabilities = capabilites,
        cmd = { "rustup", "run", "stable", "rust-analyzer" }
    }

    lspconfig["cmake"].setup{
        on_attach = on_attach,
        capabilities = capabilites,
    }
  end,
}
