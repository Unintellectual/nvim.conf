return {

	-- {
	-- 	"maxmx03/fluoromachine.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local fm = require("fluoromachine")
	--
	-- 		fm.setup({
	-- 			glow = false,
	-- 			theme = "fluoromachine",
	-- 			transparent = true,
	-- 		})
	--
	-- 		vim.cmd.colorscheme("fluoromachine")
	-- 	end,
	-- },

	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("oxocarbon")
	-- 	end,
	-- },

	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,

		config = function()
			local fm = require("modus-themes")
			fm.setup({

				style = "modus_vivendi",
				variant = "default",
				transparent = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					functions = {},
					variables = {},
				},
			})

			vim.cmd.colorscheme("modus_vivendi")
		end,
	},
}
