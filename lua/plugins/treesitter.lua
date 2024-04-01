-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				-- Mandatory parsers installed here
				ensure_installed = { "lua", "c", "cpp", "rust", "go", "javascript", "typescript", "vim" },
				auto_install = true, -- Auto installs required parsers
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	config = function()
		require("treesitter-context").setup({})
	end,
}
