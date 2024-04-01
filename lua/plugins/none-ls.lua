-- None-ls
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				-- Install packages
				ensure_installed = {
					"stylua",
					"prettier",
					"black",
					"eslint_d",
				},
			})
		end,
	},
	config = function()
		local null_ls = require("null-ls")

		-- Configure packages
		null_ls.setup({
			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,

				-- Linters
				null_ls.builtins.diagnostics.eslint_d,
			},
		})
	end,
}
