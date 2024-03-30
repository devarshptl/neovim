-- Dashboard
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header
		dashboard.section.header.val = {
			[[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ]],
			[[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ]],
			[[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ]],
			[[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
			[[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
			[[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
		}

		-- Buttons
		dashboard.section.buttons.val = {
			dashboard.button("SPC f f", "󰈞  Find file"),
			dashboard.button("SPC f g", "󰈬  Find word"),
			dashboard.button("SPC f r", "󰈬  Frequent Files"),
			dashboard.button("<C-e>", "  Explorer"),
		}

		-- Footer
		dashboard.section.footer.val = require("alpha.fortune")()

		alpha.setup(dashboard.opts)
	end,
}
