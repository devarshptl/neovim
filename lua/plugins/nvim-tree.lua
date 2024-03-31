-- Nvim tree
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			renderer = {
				group_empty = true,
			},
		})

		-- Keymap
		vim.keymap.set("n", "<C-CR>", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle file explorer" })
	end,
}
