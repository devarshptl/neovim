-- Bufferline
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = 'buffers',
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        hover = {
          enabled = true,
          reveal = { "close" },
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          }
        },
      },
    })

    -- Keymap
    vim.keymap.set("n", "<C-w>", ":bdelete<CR>", {})
    vim.keymap.set("n", "<C-a>", ":BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<C-d>", ":BufferLineCycleNext<CR>", {})
  end,
}
