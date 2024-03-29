-- Language server configurations

-- LSP
local lsp_packages = {
  "lua_ls",        -- Lua
  "clangd",        -- C/C++
  "tsserver",      -- Javascript/TypeScript
  "pyright",       -- Python
  "rust_analyzer", -- Rust
  "volar",         -- Vue
  "angularls",     -- Angular
}

return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup({})
        end
      },
      { "hrsh7th/cmp-nvim-lsp" },
      {
        "neovim/nvim-lspconfig",
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup({
        ensure_installed = lsp_packages,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  }
                }
              }
            })
          end,
        },
      })
    end,
  },
}

-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     { "hrsh7th/cmp-nvim-lsp" },
--     {
--       "williamboman/mason.nvim",
--       config = function()
--         require("mason").setup({})
--       end,
--     },
--     {
--       "williamboman/mason-lspconfig.nvim",
--       config = function()
--         require("mason-lspconfig").setup({
--           -- Ensure language servers are installed
--           ensure_installed = lsp_packages,
--         })
--       end,
--     },
--   },
--   config = function()
--     local lspconfig = require("lspconfig")
--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--     -- Setup required language servers
--     lsp_setup(lspconfig, lsp_packages, {
--       capabilities = capabilities,
--     })
--
--     -- key bindings
--     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--     vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--   end,
-- }
