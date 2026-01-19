return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "modus-vivendi",
				component_separators = "|",
				section_separators = "",
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "progrress" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "lsp_status" },
				lualine_z = { "location" },
			},
		})
	end,
}
