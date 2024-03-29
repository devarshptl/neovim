-- Toggle term
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      size = 25,
      direction = "float",
    })

    -- Keymap
    vim.keymap.set("n", "<C-/>", ":ToggleTerm<CR>", { silent = true, desc = "Toggle terminal" })
  end,
}
