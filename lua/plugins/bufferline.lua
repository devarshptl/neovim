-- Bufferline
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers",
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
          },
        },
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
    })

    -- Keymap
    vim.keymap.set("n", "<C-w>", ":bdelete<CR>", { silent = true, desc = "Delete current buffer" })
    vim.keymap.set("n", "<C-a>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Go to prev buffer" })
    vim.keymap.set("n", "<C-d>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Go to next buffer" })
  end,
}
