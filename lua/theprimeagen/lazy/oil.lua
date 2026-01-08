return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "nvim-mini/mini.icons", opts = {} },
	},

	lazy = false,
	---@module 'oil'
	---@type oil.SetupOpts

	opts = {
		columns = {
			"icon",
			"permissions",
			"size",
		},
		delete_to_trash = true,
		watch_for_changes = true,
		win_options = { signcolumn = "auto:2" },
		view_options = {
			is_hidden_file = function(name)
				local visible_dotfiles = {
					[".env"] = true,
					[".github"] = true,
					[".gitignore"] = true,
					[".env.local"] = true,
				}

				-- Hide all dotfiles except those explicitly allowed
				local is_dotfile = vim.startswith(name, ".") and name ~= ".." and not visible_dotfiles[name]

				-- Hide specific folders
				local hidden_names = {
					["node_modules"] = true,
					["dist"] = true,
					["build"] = true,
					[".venv"] = true,
					["next-env.d.ts"] = true,
					["tsconfig.tsbuildinfo"] = true,
					["pnpm-lock.yaml"] = true,
					["npm-lock.yaml"] = true,
					["yarn-lock.yaml"] = true,
				}

				return is_dotfile or hidden_names[name] == true
			end,
		},
		float = {
			-- Padding around the floating window
			padding = 2,
			-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			max_width = 0.5,
			max_height = 0.6,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			get_win_title = nil,
			preview_split = "right",
			override = function(conf)
				return conf
			end,
		},
	},
}
