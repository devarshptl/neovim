-- Treesitter
return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  config = function()
    require("treesitter-context").setup({})
  end,
}
