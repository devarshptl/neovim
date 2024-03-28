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

local function lsp_setup(lspconfig, lsp_list, setup_obj)
  for _, lsp in pairs(lsp_list) do
    lspconfig[lsp].setup(setup_obj)
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({})
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          -- Ensure language servers are installed
          ensure_installed = lsp_packages,
        })
      end,
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup required language servers
    lsp_setup(lspconfig, lsp_packages, {
      capabilities = capabilities,
    })

    -- key bindings
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  end,
}
