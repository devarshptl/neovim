-- Language server config
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Ensure language servers are installed
        -- Note: Don't forget to add this servers in the config below
        ensure_installed = {
          "lua_ls",           -- Lua
          "clangd",           -- C/C++
          "tsserver",         -- Javascript/TypeScript
          "pyright",          -- Python
          "rust_analyzer",    -- Rust
          "volar",            -- Vue
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup required language servers
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.pyright.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.volar.setup({})

      -- key bindings
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
