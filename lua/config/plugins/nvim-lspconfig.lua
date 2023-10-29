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

      require("which-key").register({
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        ["<leader>gD"] = { vim.lsp.buf.declaration, "Jump to symbol declaration" },
        ["<leader>gd"] = { vim.lsp.buf.definition, "Jump to symbol definition" },
        ["<leader>gi"] = { vim.lsp.buf.implementation, "List symbol implementations" },
        ["<leader>gt"] = { vim.lsp.buf.type_definition, "Jump to type definition" },
        ["<leader>gr"] = { vim.lsp.buf.references, "List symbol references" },
        ["<leader>R"]  = { vim.lsp.buf.rename, "Rename symbol references" },
        ["<M-h>"]      = { vim.lsp.buf.hover, "Show hover information" },
        ["<leader>ca"] = { vim.lsp.buf.code_action, "Select an available code action" },
        ["<leader>bf"] = { vim.lsp.buf.formatting, "Format current buffer" },
        ["<leader>wa"] = { vim.lsp.buf.add_workspace_folder, "Add folder to workspace" },
        ["<leader>wr"] = { vim.lsp.buf.remove_workspace_folder,  "Remove folder from workspace" },
        ["<leader>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" },
      }, { buffer = bufnr })

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
