return {
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"    -- soft, medium, hard
      vim.g.gruvbox_material_ui_contrast = "high"   -- The contrast of line numbers, indent lines, etc.
      vim.g.gruvbox_material_float_style = "bright" -- Background of floating windows
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"
    end,
    vim.api.nvim_command("colorscheme gruvbox-material")
  },
  {
    "catppuccin/nvim",
    priority = 150,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({

        transparent_background = false, -- disables setting the background color.
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          notify = false,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
        },
      })
      vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "none", fg = "#eedaad" })
      vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = "#eedaad" })
      vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = "#eedaad" })
      --
      --vim.api.nvim_command("colorscheme catppuccin-macchiato")
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "LunarVim/primer.nvim",
    enabled = false,
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme 'primer_dark'
    end,
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        -- disable_background = true,

        styles = {
          bold = false,
          italic = false,
          transparency = false,
        },
        highlight_groups = {
          TelescopeBorder = { fg = "overlay", bg = "overlay" },
          TelescopeNormal = { fg = "subtle", bg = "overlay" },
          TelescopeSelection = { fg = "text", bg = "highlight_med" },
          TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
          TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

          TelescopeTitle = { fg = "base", bg = "love" },
          TelescopePromptTitle = { fg = "base", bg = "pine" },
          TelescopePreviewTitle = { fg = "base", bg = "iris" },

          TelescopePromptNormal = { fg = "text", bg = "surface" },
          TelescopePromptBorder = { fg = "surface", bg = "surface" },
        },
      })

      --      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "oxfist/night-owl.nvim",
    enabled = false,
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local night_owl = require("night-owl")

      -- 👇 Add your own personal settings here
      night_owl.setup({
        -- These are the default settings
        bold = false,
        italics = false,
        underline = false,
        undercurl = false,
      })

      -- load the colorscheme here
      -- vim.cmd.colorscheme("night-owl")
    end,
  },
}
