return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "ray-x/lsp_signature.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
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
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    mason.setup()
    mason_lspconfig.setup({
      -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
      -- This setting has no relation with the `automatic_installation` setting.
      ---@type string[]
      ensure_installed = {
        "clangd",
        "cmake",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        -- "arduino_language_server",
      },

      -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
      -- This setting has no relation with the `ensure_installed` setting.
      -- Can either be:
      --   - false: Servers are not automatically installed.
      --   - true: All servers set up via lspconfig are automatically installed.
      --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
      --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
      ---@type boolean
      automatic_installation = false,

      -- See `:h mason-lspconfig.setup_handlers()`
      ---@type table<string, fun(server_name: string)>?
      handlers = {
        -- This is the default handler and will be called for each
        -- installed server that doesn't have a dedicated handler.
        function(server_name)
          lspconfig[server_name].setup({
            capabilites = capabilities,
            on_attach = on_attach,
          })
        end,

        -- Next, you can provide targeted overrides for specific servers.
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilites = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                -- diagnostics = {
                --   globals = {"vim"},
                -- },
                workspace = {
                  -- library = {
                  --   vim.api.nvim_get_runtime_file("lua", true),
                  -- },
                  checkThirdParty = false,
                },
              },
            },
          })
        end,

        -- ["arduino_language_server"] = function()
        --   lspconfig.arduino_language_server.setup({
        --     cmd = {
        --       "/home/rrd/.local/share/nvim/mason/bin/arduino-language-server",
        --       "-cli", "/home/rrd/.local/bin/arduino-cli",
        --       "-cli-config", "/home/rrd/.arduino15/arduino-cli.yaml",
        --       "-clangd", "/home/rrd/.local/share/nvim/mason/bin/clangd",
        --     },
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --   })
        -- end,
      },
    })

    -- Depending on your platform, mason may fail to install some language servers.
    -- When that happens, you need to install the server manually and set it up here.
    -- Example:
    -- lspconfig["clangd"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })

  end,
}
