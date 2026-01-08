vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-S-x>", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>e", ":Oil --float<CR>")
-- vim.keymap.set("n", "<leader>e", ":Neotree source=filesystem reveal=true position=right<CR>")

vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>st", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 8)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)
