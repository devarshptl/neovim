-- Language server configurations

-- LSP
local lsp_packages = {
  "lua_ls",    -- Lua
  "clangd",    -- C/C++
  "tsserver",  -- Javascript/TypeScript
  "pyright",   -- Python
  "gopls",     -- Go
  "volar",     -- Vue
  "angularls", -- Angular
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
  -- Use dedicated rust plugin
  {
    "mrcjkb/rustaceanvim",
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
}
