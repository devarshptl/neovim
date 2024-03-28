-- Toggle term
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      size = 25,
      direction = "float",
      open_mapping = [[<C-`>]],
    })

    -- Keymap
    vim.keymap.set("n", "<C-`>", ":ToggleTerm<CR>", {})
  end,
}
