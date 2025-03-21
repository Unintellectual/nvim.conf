function ColorMyPencils(color)
    color = "gruber-darker"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
            })

            -- vim.cmd("colorscheme rose-pine")
            --
            -- ColorMyPencils()
        end
    },

    {
        "alexxGmZ/e-ink.nvim",
        priority = 1000,
        config = function()
            require("e-ink").setup()
            vim.cmd.colorscheme "e-ink"

            -- choose light mode or dark mode
            vim.opt.background = "dark"
            -- vim.opt.background = "light"
            --
            --
            ColorMyPencils()
            -- or do
            -- :set background=dark
            -- :set background=light
        end
    },

    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("lackluster")
            -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
            -- vim.cmd.colorscheme("lackluster-mint")
        end,
    },
    {
        "blazkowolf/gruber-darker.nvim",
        opts = {
            bold = false,
            invert = {
                signs = false,
                tabline = false,
                visual = false,
            },
            italic = {
                strings = true,
                comments = true,
                operators = false,
                folds = true,
            },
            undercurl = true,
            underline = true,
        }
    },

    {
        'comfysage/evergarden',
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        opts = {
            theme = {
                variant = 'fall', -- 'winter'|'fall'|'spring'
                accent = 'green',
            },
            editor = {
                transparent_background = false,
                sign = { color = 'none' },
                float = {
                    color = 'mantle',
                    invert_border = false,
                },
                completion = {
                    color = 'surface0',
                },
            },
        }
    }
}
