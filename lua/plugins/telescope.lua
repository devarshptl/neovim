-- Telescope
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")

      -- keymap
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true, desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true, desc = "Live grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
