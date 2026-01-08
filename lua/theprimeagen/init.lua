require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup("ThePrimeagen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = ThePrimeagenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = ThePrimeagenGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>gr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, opts)
	end,
})

local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0

		vim.bo.filetype = "terminal"
	end,
})

-- vim.g.netrw_banner = 0
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_winsize = 25
