-- return {
--     "nvim-telescope/telescope.nvim",
--
--     tag = "0.1.6",
--
--     dependencies = {
--         "nvim-lua/plenary.nvim"
--     },
--
--     config = function()
--         require('telescope').setup({})
--
--         local builtin = require('telescope.builtin')
--         vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--         vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--         vim.keymap.set('n', '<leader>pws', function()
--             local word = vim.fn.expand("<cword>")
--             builtin.grep_string({ search = word })
--         end)
--         vim.keymap.set('n', '<leader>pWs', function()
--             local word = vim.fn.expand("<cWORD>")
--             builtin.grep_string({ search = word })
--         end)
--         vim.keymap.set('n', '<leader>ps', function()
--             builtin.grep_string({ search = vim.fn.input("Grep > ") })
--         end)
--         vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
--     end
-- }
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.providers.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<C-p>", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>ps", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
