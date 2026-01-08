return {
	"nvim-telescope/telescope.nvim",
	tag = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-f>", builtin.find_files, {})
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
		-- vim.keymap.set("n", "<leader>g", builtin.grep_string, {})
	end,
}
